$(document).ready(function(){
  var listItem = $('.pagination li:first-child a') 
  if (listItem.attr('href') === "/?page=0") {listItem.parent().addClass("disabled")}

});
