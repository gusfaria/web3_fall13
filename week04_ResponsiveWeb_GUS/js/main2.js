
// var menu = document.getElementsByClassName('menu_item');
// function myClick(){
// 	alert("HELLO!");  	
// 	this.style.background='blue';
// }

for(var i=0; i<menu.length; i++) { 
  // menu[i].style.background='pink';
  // console.log(menu[i]);
  menu[i].addEventListener("click", myClick, false);
}


var menu = document.getElementById('menu_collapsed');
menu.addEventListener("click", function(){
	var wrappers = document.getElementsByClassName('wrappers');
	for(var i=0; i<wrappers.length; i++) {
			wrappers[i].classList.toggle("is_clicked");
	}
}, false);


var poke = document.getElementById('poke');

poke.addEventListener("click", function(){
	this.classList.toggle("poke_clicked");
}, false);



var user_drop = document.getElementById('user_header');
user_drop.addEventListener("click", function(){
	var allUsers = document.getElementById('users_wrapper')
	allUsers.classList.toggle("user_clicked");
}, false);


var about_drop = document.getElementById('about_header');
about_drop.addEventListener("click", function(){
	var allabout = document.getElementById('about_wrapper')
	allabout.classList.toggle("is_clicked");
}, false);