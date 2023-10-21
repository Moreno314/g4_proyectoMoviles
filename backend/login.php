<?php
    
	header("Access-Control-Allow-Origin: *");
	$db = mysqli_connect("localhost", "root", "", "flutter_grupo4");
    
    if (!$db) {
        echo "Database connect error: " . mysqli_error($db);
    }
	
	$username=$_POST['username'];
	$password=$_POST['password'];
	
	$sql="SELECT * FROM login_register WHERE username='".$username."' AND password= '".$password."'";
	$query = mysqli_query($db,$sql);
	$userdata=array();
	
	$count=mysqli_num_rows($query);

	if ($count==1) {
		$sql="SELECT * FROM login_register WHERE username='".$username."' ";
			$query = mysqli_query($db,$sql);
			$data=mysqli_fetch_array($query);
			$userdata=$data;
		echo json_encode($userdata);

    }else {
		echo json_encode("ERROR");
	}
?>