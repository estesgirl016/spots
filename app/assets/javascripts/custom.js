$(document).ready( function() {
  $(".dropdown-button").dropdown();
  $("#spot-carousel").carousel();

 $("#spot-carousel").swiperight(function() {
   $(".carousel span.fa-chevron-left").click();
 });

 $("#spot-carousel").swipeleft(function() {
   $(".carousel span.fa-chevron-right").click();
 });

});
