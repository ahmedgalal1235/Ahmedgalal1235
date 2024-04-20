<?php

include("./connect.php");
//include("./adddata.php");


error_reporting(0);

$fitness_goal=$_POST['fitness_goal'];
$activity=$_POST['activity'];
$email = $_POST['email'];





if(empty($fitness_goal)||empty($activity)){

}
else{


//fghj
//ghjm,
//UPDATE `user`SET `fitness_goal`=500,`activity`=1.3 WHERE email="galal@ah"


$sql="UPDATE `user`SET `fitness_goal`=$fitness_goal,`activity`=$activity  WHERE email='".$email."'";
//$result=$con->query($sql);

$query=mysqli_query($con,$sql);
if($query){
    
 
    echo json_encode("ERROR");
      


}

}
?>