<?php
require_once 'db_connect.php';

if($_POST){
	$first_name=$_POST["first_name"];
	$last_name=$_POST["last_name"];

	

	$sql="INSERT INTO `author`(`first_name`, `last_name`) 
	      VALUES ('$first_name','$last_name')";

	if(mysqli_query($conn, $sql)){
		echo "success <br>
		<a href='../index.php'>Back to the media list page</a>
		";
	}else{
		echo "error";
	};
};

?>