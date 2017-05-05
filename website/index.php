<?php

// ******** 'build.php' ********
//
include('build.php');
//
// build_page: Should be called after all database queries are done, and no 
//                 tampering has been detected.
//
//             params:  current_table -> string
//                      stid          -> oracle
//                      tables        -> array of strings
//                      root          -> string
//                      
//             returns: nothing
//
// no_senor: Should be called if the page hit an error, or if tampering is
//               detected.
//
//           params: message -> string
//
//           returns: nothing
//
// build_error: Builds error page
//
//              params: message -> string
//
//              returns: nothing
//
// *****************************

// ******** 'post.php' ********
//
include('post.php');
//
// process_post: Will verify post parameters, and will submit to database
//
//               parameters: post_parameters -> array of strings
//                           table           -> string
//
//               returns: string, false if invalid parameters
//
// ****************************

// ******** 'config.php' ********
//
include('config.php');
//
// accepted_tables: Called to get configured tables, first element is the 
//                      default table
//
//                  params: nothing
//
//                  returns: array of strings
//
// root: Called to get configured site root
//
//                  params: nothing
//
//                  returns: string;
//
// ******************************


// configs
$accepted_tables = accepted_tables();
$root = root();


function database_lookup($table){
  // create connection to Oracle
  $conn = oci_connect('hadentj', 'V00736034', 'localhost:20037/xe'); // this is localhost, i.e., jasmine.cs.vcu.edu
  
  if (!$conn) {
    // connection was unsuccessful
    return null;
    
  } else {
    // connection was successful
    $stid = oci_parse($conn, 'SELECT * FROM ' . $table); 
    oci_execute($stid);
   
    // close the Oracle connection
    oci_close($conn);
    
    return $stid;
  }
}


// check for query string
if($_SERVER['QUERY_STRING'] == ''){
  // no query string found
  no_senor('Query string is missing.');
  exit;
}

// check if query string is valid
$valid_query_table = '';
for($i = 0; $i < count($accepted_tables); $i++) {
  if ($_SERVER['QUERY_STRING'] == $accepted_tables[$i]){
    $valid_query_table = $accepted_tables[$i];
  }
}

if($valid_query_table == ''){
  // query string is not a valid table
  no_senor('Query string has to match an allowed table.');
  exit;
}

// check for POST parameters
if(count($_POST) == 0){
  // no post parameters found, make normal page build
  $view_i = views();
  if(array_key_exists($valid_query_table, $view_i)){
    $stid = database_lookup($view_i[$valid_query_table]);
  } else {
    $stid = database_lookup($valid_query_table);
  }
  // check if database lookup was successful
  if($stid){
    // database lookup was succesful
    build_page($valid_query_table, $stid, $accepted_tables, $root, '');
  } else{
    // database lookup was not succesful
    build_error('Database lookup failed');
  }
  exit;
}

// check if POST parameters are valid, process if they are
$post_response = process_post($_POST, $valid_query_table);
if($post_response == ''){
  // POST parameters are not valid
  no_senor('Someone tried hampering with the html form.');
  exit;
} else {
  // POST parameters are valid, make normal page build
  $view_i = views();
  if(array_key_exists($valid_query_table, $view_i)){
    $stid = database_lookup($view_i[$valid_query_table]);
  } else {
    $stid = database_lookup($valid_query_table);
  }
  // check if database lookup was successful
  if($stid){
    // database lookup was succesful
    build_page($valid_query_table, $stid, $accepted_tables, $root, $post_response);
  } else {
    // database lookup was not succesful
    build_error('Database lookup failed');
  }
  exit;
}

?>