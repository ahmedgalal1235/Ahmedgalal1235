<?php

include("./connect.php");
error_reporting(0);


$email = $_POST['email'];

$sql="SELECT 22*weight*activity+fitness_goal  as total_cal FROM graduationdb.inbody join graduationdb.`user` on `user`.id =`inbody`.id_user and   email='".$email."' ";

$queryc=mysqli_query($con,$sql);
$res=mysqli_fetch_array($queryc);

$total= $res["total_cal"];

$query =$con->query("SELECT * FROM graduationdb.meals where type>='".$total."' and type<'".$total."'+500");
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