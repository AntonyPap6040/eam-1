<?php // formtest2.php
	require_once 'login.php';
	$conn = new mysqli($hn,$un,$pw,$db);
	mysqli_set_charset($conn,'utf8');
	if($conn->connect_error) die($conn->connect_error);
	
	
   
		if(isset($_POST['username'])){
			$username = $_POST['username'];
			$query = "SELECT * FROM userprofile WHERE username='$username'";
			$result = mysqli_query($conn,$query);

			$result = mysqli_num_rows($result);
				if($result==1){
					echo "Το όνομα χρήστη που τοποθετήσατε υπάρχει ήδη , δοκιμάστε ξανα με κάποιο άλλο";
		
				}
		}
		


?>