<?php

	header('Content-type: text/plain; charset=utf8');
	require_once 'login.php';
	$conn = new mysqli($hn,$un,$pw,$db);
    mysqli_set_charset($conn,'utf8'); 


	if($conn->connect_error) die($conn->connect_error);
			if (isset($_POST['userup']) && isset($_POST['passup']) && isset($_POST['amka']) && isset($_POST['afm']) && isset($_POST['idnum'])) {
														
				$username = $_POST['userup'];
				
				$query = "SELECT '$username' FROM userprofile";
				$result = mysqli_query($conn,$query);
				if($result){
					$smsg = "Το όνομα χρήστη που τοποθετήσατε υπάρχει ήδη , δοκιμάστε ξανα με κάποιο άλλο";
				}
							
				
				
				$password =  $_POST['passup'];
				$amka =  $_POST['amka'];
				$afm =  $_POST['afm'];
				$name =  $_POST['nameup'];
				$surname =  $_POST['surnameup'];
				$idnum =  $_POST['idnum'];
				$idtype =  $_POST['idtype'];
				$phone =  $_POST['phone'];
				$email =  $_POST['email'];
				$usertype =  $_POST['ustype'];
				
				if ($usertype  = 'Συνταξιούχος') $usertype =2;
				else if ($usertype  = 'Εργοδότης') $usertype =1;
				else  $usertype =3;
				
				if ($idtype  = '1') $idtype ='ΑΣΤΥΝΟΜΙΚΗ';
				else if ($idtype  = '2') $idtype ='ΔΙΑΒΑΤΗΡΙΟ';
				
				
				
				
				$query = "INSERT INTO userprofile (username, password , amka , afm ,name ,surname, idnum,idtype,phone,email,user_type) VALUES ('$username', '$password', '$amka','$afm','$name','$surname','$idnum','$idtype','$phone','$email','$usertype')";
				$result = mysqli_query($conn,$query);
				if($result){
					$smsg = "Ο λογαριασμός σας δημιουργήθηκε με επιτυχία";
				}
				else{
					$fsms = "Εγινε καποιο λαθος προσπαθηστε ξανα";
				}
	}else 
	{
			header("Location: error.html");

	}
	header("Location: {$_SERVER['HTTP_REFERER']}");
exit;
?>