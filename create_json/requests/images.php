<?php

	// php arrays  --- $foo = array( 'key' => 'value');
	// access via $foo['key'] 
	
	// var foo = { 'key': 'value' }
	//foo[key] foo.key 
	
	$images = array();
	
	//glob gets all elements that match the string so * means anything inside of our uploads folder - 
	//if we said *.jpg it would only get the jpgs
	
	foreach( glob("../uploads/*") as $filename){
		
		//remove --- ../
		$filename = substr($filename, 3);
		
		$temp = array('url'=> $filename);
		
		//put into back of array
		array_push($images,$temp);
	
	}
	//php array
	/*array( array('url'=>path),
			array('url'=>path)
	);*/
	
	//json
	//{{ 'url': filepath }, {'url': filepath}}
	
	//check for JSONP Callback request	
	if(isset($_GET['callback'])){
	
		echo $_GET['callback'].'('.json_encode($images).')';
	
	}else{
	
		echo json_encode($images);

	}
	
	

?>