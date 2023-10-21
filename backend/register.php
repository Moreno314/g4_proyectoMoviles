<?php
    
	header("Access-Control-Allow-Origin: *");
	$db = mysqli_connect("localhost", "root", "", "flutter_grupo4");
    
    if (!$db) {
        echo "Database connect error: " . mysqli_error($db);
    }
	
	$name=$_POST['name'];
	$username=$_POST['username'];
	$password=$_POST['password'];
	
	$sql="SELECT * FROM login_register WHERE username='".$username."' ";
	$query = mysqli_query($db,$sql);
	$userdata=array();
	
	$count=mysqli_num_rows($query);

	if ($count==1) {
		echo json_encode("ERROR");

    }else {
		$insert="INSERT INTO login_register(name,username,password)VALUES('".$name."','".$username."','".$password."')";
		$result=mysqli_query($db,$insert);
		if($result){
			$sql="SELECT * FROM login_register WHERE username='".$username."' ";
			$query = mysqli_query($db,$sql);
			$data=mysqli_fetch_array($query);
			$userdata=$data;
		}
		echo json_encode($userdata);
	}
?>