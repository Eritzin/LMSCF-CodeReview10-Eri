<?php 

require_once 'actions/db_connect.php';

if($_GET["id"]){
	$media_id=$_GET["id"];

	$sql="DELETE FROM media WHERE media_id=$media_id";

	if(mysqli_query($conn, $sql)){
		echo "success <br> <a href='index.php'>Back to Home Page</a>";
	}else{
		echo "error";
	};
}
 $conn->close();

 ?>