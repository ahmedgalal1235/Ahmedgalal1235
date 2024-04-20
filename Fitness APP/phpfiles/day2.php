<?php

include("../connect.php");
error_reporting(0);

$email = $_POST['email'];


//--------------------------------
$sql="SELECT * FROM `inbody` JOIN `user`on inbody.ID_USER=user.ID WHERE email='".$email."' ORDER by inbody.ID DESC LIMIT 1 ";
//$result=$con->query($sql);

$queryc=mysqli_query($con,$sql);
$res=mysqli_fetch_array($queryc);

$weight= $res["weight"];
$fitness_level= $res["fitness_level"];

$height= $res["height"];

$fat_percent= $res["fat_percent"];
$mass_muscles= $res["mass_muscles"];
$body_water= $res["body_water"];
$fitness_goal= $res["fitness_goal"];






//--------------------
if($fitness_level>85||($fitness_level % 2)==0){

   
    $query7 =$con->query("SELECT * FROM graduationdb.`workout` WHERE  Category like'%Stretches%' limit 1 ");
    $query11 =$con->query("SELECT * FROM graduationdb.`workout` WHERE   id =455");
  
    $query8 =$con->query("SELECT * FROM graduationdb.`workout` Where id=42
");
    $query9 =$con->query("SELECT * FROM graduationdb.`workout` WHERE  id=464
");
    $query10 =$con->query("SELECT * FROM graduationdb.`workout` WHERE  id=471
 ");  
    $query12 =$con->query("SELECT * FROM graduationdb.`workout` WHERE  id=1
");
    $query13 =$con->query("SELECT * FROM graduationdb.`workout` WHERE  id=2");
    $query14 =$con->query("SELECT * FROM graduationdb.`workout` WHERE  id=601");

$result=array();

while($rowdata8=$query7->fetch_assoc()){
    while($rowdata12=$query11->fetch_assoc()){

    while($rowdata9=$query8->fetch_assoc()){
    while($rowdata10=$query9->fetch_assoc()){
    while($rowdata11=$query10->fetch_assoc()){
            while($rowdata13=$query12->fetch_assoc()){
    while($rowdata14=$query13->fetch_assoc()){
        while($rowdata15=$query14->fetch_assoc()){


    $result[]=$rowdata8;
    $result[]=$rowdata12;

    $result[]=$rowdata9; 
            $result[]=$rowdata10; 
        $result[]=$rowdata11; 
                $result[]=$rowdata13; 
        $result[]=$rowdata14; 
        $result[]=$rowdata15; 
        }


    }
    }}}}}
}

if($fitness_goal==1000){
    $rest="3-5min";
    $sets="3-4";
    $reps="1-5";
}elseif($fitness_goal==2){
    $rest="30-60 S";
    $sets="3-4";
    $reps="15-20";
}else{
    $rest="120 S";
    $sets="3-4";
    $reps="8-12";
}


}
elseif($fitness_level>85){

     
    $query7 =$con->query("SELECT * FROM graduationdb.`workout` WHERE  Category like'%Stretches%' limit 1 ");
    $query11 =$con->query("SELECT * FROM graduationdb.`workout` WHERE   id =42");
  
    $query8 =$con->query("SELECT * FROM graduationdb.`workout` Where id=455
");
    $query9 =$con->query("SELECT * FROM graduationdb.`workout` WHERE  id=471
");
    $query10 =$con->query("SELECT * FROM graduationdb.`workout` WHERE  id=464
 ");  
    $query12 =$con->query("SELECT * FROM graduationdb.`workout` WHERE  id=3
");
    $query13 =$con->query("SELECT * FROM graduationdb.`workout` WHERE  id=2");
    $query14 =$con->query("SELECT * FROM graduationdb.`workout` WHERE  id=832");

$result=array();

while($rowdata8=$query7->fetch_assoc()){
    while($rowdata12=$query11->fetch_assoc()){

    while($rowdata9=$query8->fetch_assoc()){
    while($rowdata10=$query9->fetch_assoc()){
    while($rowdata11=$query10->fetch_assoc()){
            while($rowdata13=$query12->fetch_assoc()){
    while($rowdata14=$query13->fetch_assoc()){
        while($rowdata15=$query14->fetch_assoc()){


    $result[]=$rowdata8;
    $result[]=$rowdata12;

    $result[]=$rowdata9; 
            $result[]=$rowdata10; 
        $result[]=$rowdata11; 
                $result[]=$rowdata13; 
        $result[]=$rowdata14; 
        $result[]=$rowdata15; 
        }


    }
    }}}}}
}

if($fitness_goal==1000){
    $rest="3-5min";
    $sets="3-4";
    $reps="1-5";
}elseif($fitness_goal==2){
    $rest="30-60 S";
    $sets="3-4";
    $reps="15-20";
}else{
    $rest="120 S";
    $sets="3-4";
    $reps="8-12";
}

}


else{
$query =$con->query("SELECT * FROM graduationdb.`workout` WHERE   Category like'%Stretches%' limit 1 ");

$query1 =$con->query("SELECT * FROM `workout` WHERE  id=734");
$query2 =$con->query("SELECT * FROM graduationdb.workout where id=729
");
$query3 =$con->query("SELECT * FROM graduationdb.workout where id=485");
$query4 =$con->query("SELECT * FROM graduationdb.workout where id=484");
$query5 =$con->query("SELECT * FROM graduationdb.workout where id=464");
$query6 =$con->query("SELECT * FROM graduationdb.workout where id=15");
$query7 =$con->query("SELECT * FROM graduationdb.workout where id=775");

;
$result=array();

while($rowdata=$query->fetch_assoc()){
while ($rowdata2=$query1->fetch_assoc()){
    while ($rowdata3=$query2->fetch_assoc()){
        while ($rowdata4=$query3->fetch_assoc()){
            while ($rowdata5=$query4->fetch_assoc()){
                while ($rowdata6=$query5->fetch_assoc()){
                    while ($rowdata7=$query6->fetch_assoc()){
                        while ($rowdata8=$query7->fetch_assoc()){




$result[]=$rowdata;
$result[]=$rowdata2;
$result[]=$rowdata3;
$result[]=$rowdata4;
$result[]=$rowdata5;
$result[]=$rowdata6;
$result[]=$rowdata7;
$result[]=$rowdata8;



                        }

         } }         } }    }

}}


if($fitness_goal==1000){
    $rest="3-5min";
    $sets="3-4";
    $reps="1-5";
}elseif($fitness_goal==2){
    $rest="30-60 S";
    $sets="3-4";
    $reps="15-20";
}else{
    $rest="120 S";
    $sets="3-4";
    $reps="8-12";
}

}

$result[]=array("rest"=>$rest,"reps"=>$reps,"sets"=>$sets);


echo json_encode($result);


?>