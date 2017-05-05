<?php

function type_conv($type){
  switch ($type) {
    case 'pass':
      return 'id="pass_id" type="password"';
    case 'date':
      return 'type="datetime-local"';
    case 'time':
      return 'type="time"';
    case 'id':
      return 'type="number"';
    case 'week':
      return 'type="number" min="1" max="7"';
    case 'str':
    case 'email':
    case 'num':
    case '2ch':
    case 'dec':
    default:
      return 'type="text"';
  }
}

function parse_for_form($table, $root, $keys, $types){
  if(in_array('pass', $types)){
    $output = '<form action="' . $root . '?' . $table . '" method="post" onsubmit="pass_handler();">';
  } else {
    $output = '<form action="' . $root . '?' . $table . '" method="post" >';
  }
  
  
  $disabled_id = array_key_exists($table, views());
  
  for($i = 0; $i < count($keys); $i++) {
    if($i == 0 and $disabled_id){
      $output .= '  ' . strtoupper($keys[$i]) . ': <input type="text" disabled value="auto_increment" /><br /><br />';
      $output .= '  <input type="hidden" value="auto_increment" name="' . $keys[$i] . '"/>';
    } else{
      $output .= '  ' . strtoupper($keys[$i]) . ': <input ' . type_conv($types[$i]) . ' name="' . $keys[$i] . '" /><br /><br />';
    }
  }
  
  $output .= '  <input type="hidden" name="best_proffessor_ever" value="Dr.Cano" />';
  $output .= '  <input type="submit" value="INSERT" />';
  $output .= '</form>';
  
  return $output;
}

function build_form($table, $root){
  $accepted_tables_b = accepted_tables();
  $table_keys_b = table_keys();
  $table_types_b = table_types();
  
  for($i = 0; $i < count($table_keys_b); $i++) {
    if($table == $accepted_tables_b[$i]){
      return parse_for_form($table, $root, $table_keys_b[$i], $table_types_b[$i]);
    }
  }
  
  return '';
}

function build_sidenav($tables, $root){
  $output = "";
  for($i = 0; $i < count($tables); $i++) {
    $output .= "<li><a href='" . $root . "?" . $tables[$i] . "'><i class='fa fa-fw fa-table'></i>&nbsp;&nbsp;" . $tables[$i] . "</a>\n";
  }
  return $output;
}

function build_table($stid){
  $output = "<thead>\n<tr>\n";
  
  for ($i = 1; $i <= oci_num_fields($stid); $i++) {
    $name = oci_field_name($stid, $i);
    $output .= "<td>" . $name . "</td>\n";
  }
  
  $output .= "</tr>\n</thead>\n<tbody>";
  
  while ($row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS)) {
    $output .= "<tr>\n";
    foreach ($row as $item) {
      $output .= "<td>" . ($item !== null ? htmlentities($item, ENT_QUOTES) : "&nbsp;") . "</td>\n";
    }
    $output .= "</tr>\n";
  }
  
  $output .= "</tbody>";
  
  return $output;
}

function build_page($current_table, $stid, $tables, $root, $post_response){
  $default_page = $root . "?" . $tables[0];
  $sidenav_html = build_sidenav($tables, $root);
  $form_html = build_form($current_table, $root);
  $table_html = build_table($stid);
  
  print('<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DB Project</title>
    <!-- Bootstrap Core CSS --><link href="css/bootstrap.min.css" rel="stylesheet"><!-- Custom CSS --><link href="css/sb-admin.css" rel="stylesheet"><!-- Custom Fonts --><link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"><!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries --><!-- WARNING: Respond.js doesn\'t work if you view the page via file:// --><!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script><script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script><![endif]--><link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon"><link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <script src="js/sha.js"></script>
    <script type="text/javascript">
function pass_handler(){
  var pass_element = document.getElementById("pass_id");
  if (pass_element.value != "" || 1 == 1){
    var sha256 = new jsSHA("SHA-256", "TEXT");
    sha256.update(pass_element.value);
    pass_element.value = sha256.getHash("HEX");
  } else {
  }
}
    </script>
  </head>
  <body>
      <div id="wrapper">
          <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
              <div class="navbar-header">
                  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                      <span class="sr-only">Toggle navigation</span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                  </button>
                  <a class="navbar-brand" href="' . $default_page . '">Database Project | <small>By: Tyler Haden and Christopher Tanner</small></a>
              </div>
              <div class="collapse navbar-collapse navbar-ex1-collapse">
                  <ul class="nav navbar-nav side-nav">
                    ' . $sidenav_html . '
                  </ul>
              </div>
             
          </nav>

          <div id="page-wrapper">

              <div class="container-fluid">

                  <!-- Page Heading -->
                  <div class="row">
                      <div class="col-lg-12">
                          <h1 class="page-header">
                              Table <strong>' . $current_table . '</strong>
                          </h1>
                          <p style="color:red;background:#d9d9d9;font-family:Consolas,Monaco,Lucida Console,Liberation Mono,DejaVu Sans Mono,Bitstream Vera Sans Mono,Courier New;">
                          ' . $post_response . '
                          </p>
                          ' . $form_html . '
                      </div>
                  </div>
                  <!-- end Page Heading -->
                  
                  <!-- Table -->
                  <div class="row">
                      <div class="col-lg-12">
                          <h2>' . $current_table . '</h2>
                          <div class="table-responsive">
                              <table class="table table-bordered table-hover table-striped">
                                ' . $table_html . '
                              </table>
                          </div>
                      </div>
                  </div>
                  <!-- end Table -->
                  
              </div>
              <!-- /.container-fluid -->

          </div>
          <!-- /#page-wrapper -->

      </div>
      <!-- /#wrapper -->

      <!-- jQuery -->
      <script src="js/jquery.js"></script>

      <!-- Bootstrap Core JavaScript -->
      <script src="js/bootstrap.min.js"></script>
      
  </body>
</html>');

}

function no_senor($message){
  print("<html>
  <head>
    <title>No Se&ntilde;or!</title>
  </head>
  <body>
    <img src='https://cdn.meme.am/cache/instances/folder274/500x/57445274.jpg' style='width:33.3333%;position:absolute;left:33.33333%;'>
  </body>
  <script>console.log('" . $message . "');</script>
</html>");
}

function build_error($message){
  if($message){
    print('<h2>' . $message . '</h2>');
  } else {
    print('<h2>Something went wrong, and I don\'t know what it is.</h2>');
  }
}

?>