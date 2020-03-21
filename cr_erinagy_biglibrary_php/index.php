<!DOCTYPE html>
<html>
<head>
	<title>Big Library System</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
   <h3>Media List</h3>
   <ul class="nav nav-tabs">
   	<li class="nav-item">
    <a class="nav-link" href="create.php">Add a media</a>
    </li>
    <li class="nav-item">
    <a class="nav-link" href="createauth.php">Add a Author</a>
    </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Add a Publisher</a>
  </li>
 
</ul>

   <table class="table">
  <thead>
    <tr>
      <th scope="col">id</th>
      <th scope="col">Title</th>
      <th scope="col">Type</th>
      <th scope="col">Author</th>
      <th scope="col">Publisher</th>
      <th scope="col">Image</th>      
      <th scope="col">Availability</th>
      <th scope="col">Edit</th>
    </tr>
  </thead>
  <tbody>
    
        <?php
	  include ("actions/db_connect.php");

	   $sql = "SELECT media_id,title,type_name,first_name,last_name,publisher_name,availability,image_url
	           FROM media 
	           INNER JOIN media_type on fk_type_id = type_id
	           INNER JOIN author on fk_author_id = author_id
	           INNER JOIN publisher on fk_publisher_id = publisher_id";
	           
	           
	   $result = mysqli_query($conn, $sql);
       $conn->close();

	   if($result->num_rows == 0){
	   	echo "No result";
	   }elseif($result->num_rows == 1){
	   	$row = $result->fetch_assoc();
	   	echo "<tr><th scope=\"row\">".$row["media_id"]."</th><td>".$row["title"] ."</td> <td>" . $row["type_name"] . "</td> <td> " . $row["first_name"] . " " . $row["last_name"]. "</td> <td> " . $row["publisher_name"]. "</td> <td> " .$value["image_url"]."</td> <td> " . $row["availability"]."</td><td><a href='update.php?id=".$row["media_id"]."'>Update</a></td><td><a href='delete.php?id=".$row["media_id"]."'>Delete</a></td></tr>";
	   }else{
	   	$rows = $result->fetch_all(MYSQLI_ASSOC);
	   	foreach($rows as $key => $value){
	   	 echo "<tr><th scope=\"row\">".$value["media_id"]."</th><td>".$value["title"] ."</td> <td>" . $value["type_name"] . "</td> <td> " . $value["first_name"] . " " . $value["last_name"]. "</td> <td> " . $value["publisher_name"]. "</td> <td> " .$value["image_url"]."</td> <td> " . $value["availability"]."</td><td><a href='update.php?id=".$value["media_id"]."'>Update</a> <a href='delete.php?id=".$value["media_id"]."'>Delete</a></td></tr>";
	   	}
	   };
/*. "<a href='update.php?id=".$value["media_id"]."'>Update</a> <a href='delete.php?id=".$value["media_id"]."'>Delete</a><br>"*/
	?>

  </tbody>
</table>


	
</body>
</html>

