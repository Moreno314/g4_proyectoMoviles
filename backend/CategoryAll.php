<?php
    
	header("Access-Control-Allow-Origin: *");
	$db = mysqli_connect("localhost", "root", "", "flutter_grupo4");
    
    if (!$db) {
        echo "Database connect error: " . mysqli_error($db);
    }
	$list=array();
	
	$result=$db->query("SELECT * FROM category");
	
	if ($result) {
        while($row=$result->fetch_assoc()){
			$list[]= $row;
			
		}
		echo json_encode($list);

    }
?>