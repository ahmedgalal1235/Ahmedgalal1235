<?php

include("./connect.php");
error_reporting(0);


$email = $_POST['email'];




//$total= $res["total_cal"];

$query =$con->query("SELECT 22*weight*activity+fitness_goal  as total_cal FROM graduationdb.inbody join graduationdb.`user` on `user`.id =`inbody`.id_user and   email='".$email."' ");
$list=array();
if($query){
    while($rowdata=$query->fetch_assoc()){
     //   echo base64_encode($rowdata["image"]);
$list[]=$rowdata;
    }
    echo json_encode($list);

}

$result[]=$rowdata;

$con->close();
return;