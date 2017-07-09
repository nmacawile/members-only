$(document).on('click', '#hide-reminder', function(e){

 e.preventDefault();

 $('#reminder').fadeOut('slow');

 return false;

});