$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()


  $('.search_wrapper').on('submit', '.main_search', function(event) {
    event.preventDefault();
    $('.results_wrapper').remove();
    var $form = $(event.target);

    $.ajax({
      method: $form.attr('method'),
      url: $form.attr('action'),
      data: $form.serialize()
    })

    .done(function (response) {
      $('.search_wrapper').append(response);
      $('.search_form')[0].reset();
    })

    .fail(function (response) {
    })
  })
  
  $('.search_wrapper').on('submit', '#new_search', function(event){
    event.preventDefault();
    $('.results_wrapper').remove();
    var $form = $(event.target);
    $.ajax({
      method: $form.attr('method'),
      url: $form.attr('action'),
      data: $form.children()
    })

    .done(function (response) {
      $('.search_wrapper').append(response);
      $('.search_form')[0].reset();
    })

    .fail(function (response) {
      console.log("i fail");
      console.log(response)
    })

  })

  $('.new_tag').on('submit', function(event) {
    event.preventDefault();
    var $form = $(event.target);
    $.ajax({
      method: $form.attr('method'),
      url: $form.attr('action'),
      data: $form.serialize()
    })

    .done(function (response) {
      $('.tag_list').append(response);
      $('#tag_form')[0].reset();
    })

    .fail(function (response) {
    })
  })

  $('.tag_wrapper').on('submit', '#delete_tag', function(event) {
    event.preventDefault();
    var $form = $(event.target);
    $.ajax({
      method: $form.attr('method'),
      url: $form.attr('action'),
      data: $form.serialize()
    })

    .done(function (response) {
      $('.tag_list').append(response);
    })

    .fail(function (response) {
    })
  })


  // starFun();

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