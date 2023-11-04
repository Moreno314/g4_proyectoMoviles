<?php
    
	header("Access-Control-Allow-Origin: *");
	$db = mysqli_connect("localhost", "root", "", "flutter_grupo4");
    
    if (!$db) {
        echo "Database connect error: " . mysqli_error($db);
    }
	$name=$_POST['name'];
	$curDate=date('d/m/Y');
	$db->query("INSERT INTO category(name,create_date)VALUES('".$name."','".$curDate."')");
	
?>