<?php

include("./connect.php");

error_reporting(0);

$email=$_POST['email'];
$password=$_POST['password'];

if(empty($email)||empty($password)){

}
else{
$hash=md5($password);
//fghj
$check="SELECT * FROM user WHERE email='".$email."' AND password='".$hash."' ";
$result=mysqli_query($con,$check);
$count=mysqli_num_rows($result);
if($count==1){
    echo json_encode("ERROR");

}else{
//ghjm,


 
 echo json_encode("success");
      


}

}
?>