<?php

include("./connect.php");
error_reporting(0);


$name=$_POST['name'];
$email=$_POST['email'];
$birthdate=$_POST['birthdate'];
$password=$_POST['password'];
$fitness_goal=$_POST['fitness_goal'];
$activity=$_POST['activity'];





    //fghj
    $check="UPDATE `user` SET `fitness_goal`=$fitness_goal WHERE email='".$email."'";
    $result=mysqli_query($con,$check);
    $count=mysqli_num_rows($result);
    if($count==1){
        echo json_encode("ERROR");
    
    }
  
    
    
    
    


?>