<?php

include("./connect.php");
error_reporting(0);


$email=$_POST['email'];





    //fghj
    $check="DELETE from `user` WHERE email='".$email."'";
    $result=mysqli_query($con,$check);
    $count=mysqli_num_rows($result);
    if($count==1){
        echo json_encode("ERROR");
    
    }
  
    
    
    
    


?>