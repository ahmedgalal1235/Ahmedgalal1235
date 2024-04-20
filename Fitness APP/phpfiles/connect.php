<?php

$host ="localhost";
$user ="id21989560_adminn";
$pass="FitnessA99#";
$dbname="id21989560_graduationdb";

$con= new mysqli($host,$user,$pass,$dbname);

if($con->connect_error){
die("connected failed". $con->connect_error);
   return;
}



?>