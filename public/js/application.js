$(document).ready(function() {

  $(".add-location > a").on("click", function(event){
    event.preventDefault();
    $(this).siblings(".hidden").toggle();    
  });

  // $(".add-location").on("submit", "input[type=submit]", function(){
  //   event.preventDefault();
  //   console.log("hi");
  // });


});
