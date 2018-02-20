
$(document).ready(function(){


	  $(document).ready(function() {
    $('select').material_select();
  });
    
  

var elem = document.getElementsByClassName('parallax')[0];

href_back = ["woman-1253488_1920.jpg","woman-1253489_1920.jpg","woman-1253501_1920.jpg","woman-1253491_1920.jpg","woman-1253504_1920.jpg","woman-1253508_1920.jpg","woman-1253509_1920.jpg"];
var y = 0 ;
// setInterval(changeBackground , 5000);
elem.style.backgroundSize = "cover";


function changeBackground()
{
	y = y % href_back.length ;
	 if( y < href_back.length )
	 {
	elem.style.backgroundImage = "url('/images/"+href_back[y]+"')";
	elem.style.transition = "all 2s ease-out";
	 }
	 y++ ; 
}

});