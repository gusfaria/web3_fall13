<?php 

	include('includes/header.php');
	
	if( sizeof($_GET)==0 && sizeof($_POST)==0 ){
	
		//echo 'No Request';
		include('includes/home.php');
	
	}else if( sizeof($_GET)>0 && sizeof($_POST)==0 ){
	
		//echo 'Just Get';
		
	}else if( sizeof($_GET)==0 && sizeof($_POST)>0 ){
	
		//echo 'Just Post';
		//var_dump($_POST); echo "<br>"; var_dump($_FILES);
		
		//include('includes/fileHandler.php');
	
	
	}else if( sizeof($_GET)>0 && sizeof($_POST)>0 ){
	
		//echo 'Both';
	
	}
	
	
?>



<?php 

	include('includes/footer.php');

?>



	

