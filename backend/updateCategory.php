<?php
    
	header("Access-Control-Allow-Origin: *");
	$db = mysqli_connect("localhost", "root", "", "flutter_grupo4");
    
    if (!$db) {
        echo "Database connect error: " . mysqli_error($db);
    }
	$id=$_POST['id'];
	$name=$_POST['name'];
	$curDate=date('d/m/Y h:i');
	$db->query("UPDATE category SET name= '".$name."',create_date='".$curDate."' WHERE id='".$id."' ");
	
?>