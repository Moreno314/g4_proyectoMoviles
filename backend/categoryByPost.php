<?php
    
	header("Access-Control-Allow-Origin: *");
	$db = mysqli_connect("localhost", "root", "123456", "flutter_grupo4");
    
    if (!$db) {
        echo "Database connect error: " . mysqli_error($db);
    }
	
	
	$name=$_POST['name'];
	$list=array();
	$result=$db->query("SELECT * FROM post_table WHERE nombre_curso= '".$name."'  ");
	
	if ($result) {
        while($row=$result->fetch_assoc()){
			$list[]= $row;
			
		}
		echo json_encode($list);

    }
?>