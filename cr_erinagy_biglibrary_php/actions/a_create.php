<?php
require_once 'db_connect.php';

if($_POST){
	$title=$_POST["title"];
	$ISBN=$_POST["ISBN"];
	$availability=$_POST["availability"];
	$author_id=$_POST["author_id"];
	$publiser_id=$_POST["publisher_id"];
	$type_id=$_POST["type_id"];
	$image_url=$_POST["image_url"];
	$publish_date=$_POST["publish_date"];

	

	$sql="INSERT INTO `media`(`title`, `ISBN`, `availability`,`fk_publisher_id`,`fk_author_id`,`fk_type_id`,`image_url`,`publish_date`) 
	      VALUES ('$title',$ISBN,'$availability',$publiser_id,$author_id,$type_id,'$image_url','$publish_date')";

	if(mysqli_query($conn, $sql)){
		echo "success <br>
		<a href='../index.php'>Back to the media list page</a>
		";
	}else{
		echo "error";
	};
};

?>