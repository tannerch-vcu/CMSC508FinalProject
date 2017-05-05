<?php

function accepted_tables(){
  return array( "beer",   // first table is always default
                "brewery",
                "locations_list", 
                "provider",
                "provider_phone",
                "brewery_phone",
                "sales",
                "sells",
                "event",
                "event_beer",
                "users",
                "hours_of_operation",
                "favorite",
                "transaction",
                "trial_users",
                "pro_users",
                "b_states",
                "b_countries" );
}

function table_keys(){
  return array(
  array('beer_id', 'beer_name', 'type', 'abv', 'ibu', 'color', 'brewery_id'),
  array('brewery_id', 'brewery_name'),
  array('location_id', 'address1', 'address2', 'address3', 'city', 'state_code', 'zip_code', 'country_code'),
  array('provider_id', 'provider_name', 'location_id'),
  array('provider_id', 'phone_number', 'phone_name'),
  array('brewery_id', 'phone_number', 'phone_name'),
  array('provider_id', 'beer_id', 'start_date', 'end_date', 'percentage_change'),
  array('provider_id', 'beer_id', 'size_sold', 'quantity', 'price', 'in_stock'),
  array('event_id', 'location_id', 'start_date', 'end_date'),
  array('event_id', 'provider_id', 'beer_id'),
  array('email', 'user_name', 'password'),
  array('provider_id', 'day_of_the_week', 'open_time', 'close_time'),
  array('email', 'beer_id'),
  array('email', 'transaction_date', 'beer_id', 'size_sold', 'quantity', 'provider_id', 'price'),
  array('email', 'end_date'),
  array('email', 'payment_processor_token', 'last_payment_date'));
}

function table_types(){
  return array(
  array('id', 'str', 'str', 'dec', 'num', 'str', 'id'),
  array('id', 'str'),
  array('id', 'str', 'str', 'str', 'str', '2ch', 'str', '2ch'),
  array('id', 'str', 'id'),
  array('id', 'phone', 'str'),
  array('id', 'phone', 'str'),
  array('id', 'id', 'date', 'date', 'dec'),
  array('id', 'id', 'num', 'num', 'num', 'num'),
  array('id', 'id', 'date', 'date'),
  array('id', 'id', 'id'),
  array('email', 'str', 'pass'),
  array('id', 'week', 'time', 'time'),
  array('email', 'id'),
  array('email', 'date', 'id', 'num', 'num', 'id', 'num'),
  array('email', 'date'),
  array('email', 'str', 'date'));
}

function views(){
  return array(
  'beer' => 'beers',
  'brewery' => 'breweries',
  'event' => 'events',
  'locations_list' => 'locations',
  'provider' => 'providers');
}

function root(){
  return "index.php";
}

?>