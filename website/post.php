<?php


function perform_query($q){
  // create connection to Oracle
  $conn = oci_connect('hadentj', 'V00736034', 'localhost:20037/xe'); // this is localhost, i.e., jasmine.cs.vcu.edu
  
  if (!$conn) {
    // connection was unsuccessful
    return '<br />Database connection failed';
    
  } else {
    // connection was successful
    $stid = oci_parse($conn, $q); 
    if(oci_execute($stid)){
      $stid2 = oci_parse($conn, 'commit'); 
      if(oci_execute($stid2)){
        oci_close($conn);
        return '<br />SUCCESS';
      }
    }
    oci_close($conn);
    return '<br />NOT SUCCESSFUL';
  }
}

function fix_date($d){
  return 'to_date(\'' . str_replace('T', ' ', $d) . ':00\', \'YYYY-MM-DD HH24:MI:SS\')';
}

function fix_time($t){
  return 'to_timestamp(\'' . $t . ':00\', \'HH24:MI:SS\')';
}

function fix_phone($n){
  return str_replace('-', '', $n);
}

function further_process($keys, $types, $values, $table){
  $aligned_values = array();
  for($i = 0; $i < count($keys); $i++){
    if(!$values[$keys[$i]]){
      return 'Missing key or value.'; // debugging . $keys[$i] . '<br />' . implode(', ', $values);
    } else {
      array_push($aligned_values, $values[$keys[$i]]);
    }
  }
  
  for($i = 0; $i < count($types); $i++){
    switch ($types[$i]){
      case ('dec'):
        if(!preg_match('/^[0-9.]*$/', $aligned_values[$i])){
          return 'One of the decimals is not correct.';
        }
        if($aligned_values[$i] >= 1){
          return 'One of the decimals is too big.';
        }
        break;
      case 'id':
        if($aligned_values[$i] == 'auto_increment'){
          break;
        }
        if(!preg_match('/^[0-9]*$/', $aligned_values[$i])){
          return 'One of the numbers is not correct.';
        }
        break;
      case 'str':
        if(!preg_match('/^[\w_\s]*$/', $aligned_values[$i])){
          return 'One of the strings is not correct.';
        }
        $aligned_values[$i] = '\'' . $aligned_values[$i] . '\'';
        break;
      case 'time':
        if(!preg_match('/^\d{2}:\d{2}$/', $aligned_values[$i])){
          return 'One of the strings is not correct.';
        }
        $aligned_values[$i] = fix_time($aligned_values[$i]);
        break;
      case 'date':
        if(!preg_match('/^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}$/', $aligned_values[$i])){
          return 'One of the datetimes is not correct.';
        }
        $aligned_values[$i] = fix_date($aligned_values[$i]);
        break;
      case 'email':
        if(!preg_match('/^[\w_@.]*$/', $aligned_values[$i])){
          return 'One of the emails is not correct.';
        }
        $aligned_values[$i] = '\'' . $aligned_values[$i] . '\'';
        break;
      case 'pass':
        if(!preg_match('/^[\w]*$/', $aligned_values[$i])){
          return 'One of the passwords is not correct.';
        }
        $aligned_values[$i] = '\'' . $aligned_values[$i] . '\'';
        break;
      case 'phone':
        if(!preg_match('/^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$/', $aligned_values[$i])){
          return 'One of the phone numbers is not correct. Needs to be in the form "111-123-1234"';
        }
        $aligned_values[$i] = '\'' . fix_phone($aligned_values[$i]) . '\'';
        break;
      case 'week':
      case 'num':
        if(!preg_match('/^[0-9.]*$/', $aligned_values[$i])){
          return 'One of the numbers is not correct.';
        }
        break;
      case '2ch':
        if(strlen($aligned_values[$i]) !== 2){
          return 'State of Country code incorrect';
        }
        if(!preg_match('/^[A-Za-z]*$/', $aligned_values[$i])){
          return 'State of Country code incorrect';
        }
        $aligned_values[$i] = '\'' . $aligned_values[$i] . '\'';
        break;
      default:
        return 'config file has wrong type';
    }
  }
  
  $views_p = views();
  $extra = '';
  if(array_key_exists($table, $views_p)){
    $aligned_values[0] = 'null';
    $extra = '-- "' . $table . '" table uses view "' . $views_p[$table] . '", null will be repaced by a sequence to generate the id<br />';
    $str_query = 'insert into ' . $views_p[$table] . ' values (' . implode(', ', $aligned_values) . ')';
  } else {
    $str_query = 'insert into ' . $table . ' values (' . implode(', ', $aligned_values) . ')';
  }
  
  $extra .= $str_query . perform_query(str_replace('auto_increment', 'null', $str_query));
  return $extra;
}

function special($p, $t){
  if(!preg_match('/^[\w]*$/', $p['delete'])){
          return 'Delete is incorrect.';
        }
        return 'Delete '.$p['delete'].' from '.$t; //.perform_query('delete ');
  
}

function process_post($post_parameters, $table){
  if(!$post_parameters['best_proffessor_ever'] or $post_parameters['best_proffessor_ever'] !== 'Dr.Cano'){
    return 'Don\'t mess with Dr.Cano';
  }
  
  if(array_key_exists('delete', $post_parameters)){
    return special($post_parameters, $table);
  }
  
  $accepted_tables_p = accepted_tables();
  $table_keys_p = table_keys();
  $table_types_p = table_types();
  
  for($i = 0; $i < count($accepted_tables_p); $i++){
    if($table == $accepted_tables_p[$i]){
      return further_process($table_keys_p[$i], $table_types_p[$i], $post_parameters, $table);
    }
  }
  
  return 'Last post was for an unkown table';
}

?>