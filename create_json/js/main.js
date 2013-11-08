$(document).ready( function(){

	$.getJSON('requests/images.php?callback=?', function(data){
	
		console.log(data);
	
		//each iterates using an index and value same as for(var i = 0; i< foo.length; i++)
		
		$.each(data, function(index, value){
		
			console.log(index +" :: "+ value.url);
			$('<img/>').attr('src', value.url).appendTo('#container');
		
		});
	
	});

});