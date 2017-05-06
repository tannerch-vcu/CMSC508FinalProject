<?php

function failed(){
  print('<h1>Login Failed</h1>');
}

function success($uname){
  print('<h1>Welcome ' . $uname . '!</h1>');
}

if(
  count($_POST) == 0 
  or !array_key_exists('email', $_POST) 
  or !array_key_exists('hash', $_POST)
  or !preg_match('/^[\w]*$/', $_POST['email'])
  or !preg_match('/^[\w_@.]*$/', $_POST['hash'])){
  failed();
  exit;
}

// create connection to Oracle
$conn = oci_connect('hadentj', 'V00736034', 'localhost:20037/xe'); // this is localhost, i.e., jasmine.cs.vcu.edu

if (!$conn) {
  // connection was unsuccessful
  failed();
  exit;
} else {
  // connection was successful
  $q = 'select user_name as "USERNAME" from users where email = \'' . $_POST['email'] . '\' and password = \'' . $_POST['hash'] . '\'';
  $stid = oci_parse($conn, $q); 
  oci_execute($stid);
  while (oci_fetch($stid)) {
    $username = oci_result($stid, 'USERNAME');
    oci_free_statement($stid);
    oci_close($conn);
    success($username);
    exit;
  }
  failed();
  oci_close($conn);
  exit;
}
?>