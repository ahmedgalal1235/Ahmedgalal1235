<?php

include("./connect.php");

error_reporting(0);

$name=$_POST['name'];
$email=$_POST['email'];
$birthdate=$_POST['birthdate'];
$password=$_POST['password'];
$gender=$_POST['gender'];
$confirmpass=$_POST['confirmpass'];

if($password!=$confirmpass ||strlen($password) <8||empty($birthdate)){

}
else{

//fghj
$check="SELECT * FROM user WHERE email='".$email."'";
$result=mysqli_query($con,$check);
$count=mysqli_num_rows($result);
if($count==1){
    echo json_encode("ERROR");

}else{
//ghjm,
$hash=md5($password);
$sql="INSERT into `user`(`name`,`email`,`birthdate`,`password`,`gender`) values('$name','$email','$birthdate','$hash','$gender')";
//$result=$con->query($sql);

$query=mysqli_query($con,$sql);
if($query){
    
 
 echo json_encode("success");
      
}

}

}
?>