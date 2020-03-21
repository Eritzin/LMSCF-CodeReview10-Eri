<!DOCTYPE html>
<html>
<head>
	<title>Big Library System</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
	<h4>Author Form</h4>
	<form action="actions/a_createauth.php" method="post"class="col-md-6">
		<label >Name</label>
		<div class="form-row">
			<div class="col">
				<input type="text" class="form-control" placeholder="First name" name="first_name">
			</div>
			<div class="col">
				<input type="text" class="form-control" placeholder="Last name" name="last_name">
			</div>
		</div>
		<br>
		<button type="submit" class="btn btn-primary" name="submit">Submit</button>
	</form>
</body>
</html>