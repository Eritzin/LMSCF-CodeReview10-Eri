<?php  
 require_once 'db_connect.php';
 if($_POST){
 	$media_id = $_POST["media_id"];
 	$title=$_POST["title"];
	$ISBN=$_POST["ISBN"];
	$availability=$_POST["availability"];
	$author_id=$_POST["author_id"];
	$publiser_id=$_POST["publisher_id"];
	$type_id=$_POST["type_id"];
	$image_url=$_POST["image_url"];
	$publish_date=$_POST["publish_date"];

    $sql = "UPDATE `media` SET `title`='$title',`ISBN`=$ISBN,`availability`='$availability',`fk_publisher_id`=$publiser_id,`fk_author_id`=$author_id,`fk_type_id`=$type_id,`image_url`='$image_url',`publish_date`='$publish_date' WHERE media_id=$media_id";

    if(mysqli_query($conn, $sql)){
    	echo"success <br> <a href='../index.php'>Back to Home Page</a>";
    }else{
    	echo "error";
    };
 };
 
?>

