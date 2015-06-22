$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $('').on('submit', function(event) {
    event.preventDefault();
    var $form = $(event.target);

    $.ajax({
      url: $form.attr('action'),
      type: $form.attr('method'),
      data: $form.serialize()
    }).done(function (response){
      $form.closest('li').remove();
    }).fail(function (response) {
      $submit_input.val("Failed, retry?")
    }) 

  })


  $('').on('submit', function(event) {
    event.preventDefault();
    var $form = $(event.target);
    var $submit_input = $form.children('input[type=submit]')

    $submit_input.val("Deleting...");

    $.ajax({
      url: $form.attr('action'),
      type: 'DELETE'

    }).done(function (response){
      $form.closest('li').remove();
    }).fail(function (response) {
      $submit_input.val("Failed, retry?")
    }) 

  });


  starFun();

});

// var starFun = function() {  

// 		$(".star-off").on("click", function(event){

//     	// var url = $(this).attr("href");

//     event.preventDefault();

//      $.ajax({
//         type: "get",
//         url:url,
//         dataType: "json"
//       })

//       .done(function(response){
//         $(".star-off").removeClass();
//         $(".star-on").addClass();

//       })
//     }
//   };