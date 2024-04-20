<?php

include("./connect.php");
error_reporting(0);

$email = $_POST['email'];




$query =$con->query("SELECT * FROM user  WHERE email='".$email."'");
$result=array();

while($rowdata=$query->fetch_assoc()){

$result[]=$rowdata;
}
echo json_encode($result);

?>