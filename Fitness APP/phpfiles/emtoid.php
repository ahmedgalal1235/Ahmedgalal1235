<?php

include("./connect.php");


error_reporting(0);

$weight=$_POST['weight'];
$height=$_POST['height'];
$email = $_POST['email'];
$fat = $_POST['fat'];
$mass = $_POST['mass'];


if( strlen($weight) >3||empty($weight)||strlen($height) >3||empty($height)||200<$weight||290<$height||30>$weight||60>$height||$fat>=50){

}



else{


//fghj
//ghjm,
//UPDATE `user`SET `fitness_goal`=500,`activity`=1.3 WHERE email="galal@ah"


$sql="SELECT * FROM user WHERE email='".$email."' ";
//$result=$con->query($sql);

$query1=mysqli_query($con,$sql);
$res=mysqli_fetch_array($query1);

$id= $res["ID"];


$sql1="INSERT into `inbody`(`ID_USER`,`height`,`weight`,`fat_percent`,`mass_muscles` ) values('$id','$height','$weight','$fat','$mass')";
$query=mysqli_query($con,$sql1);



if($query){
 
    echo json_encode("ERROR");
      


}

}
?>