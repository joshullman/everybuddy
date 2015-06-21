$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  starFun();

});

var starFun = function() {  

		$(".star-off").on("click", function(event){

    	// var url = $(this).attr("href");

    event.preventDefault();

     $.ajax({
        type: "get",
        url:url,
        dataType: "json"
      })

      .done(function(response){
        $(".star-off").removeClass();
        $(".star-on").addClass();

      })
    }
  };