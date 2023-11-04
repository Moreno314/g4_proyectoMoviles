<?php
    
	header("Access-Control-Allow-Origin: *");
	$db = mysqli_connect("localhost", "root", "", "flutter_grupo4");
    
    if (!$db) {
        echo "Database connect error: " . mysqli_error($db);
    }
	$id=$_POST['id'];

	$db->query("DELETE FROM category WHERE id='".$id."' ");
	
?>