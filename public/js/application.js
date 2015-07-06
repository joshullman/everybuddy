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




  $('.show_message_form').on('click', function(event) {
    event.preventDefault();
    var $button = $(event.target);

    $.ajax({
      url: $button.attr('href'),
      data: {event: $button.attr('value')}
    })

    .done(function (response) {
      var results = response.match(/\d+/g);
      var num = results[1]
      $("#event_post" + num).append(response);
    })

    .fail(function (response) {
    })
  })

  $('.event_wrapper').on('submit', '.new_message', function(event) {
    event.preventDefault();
    var $form = $(event.target);

    $.ajax({
      method: $form.attr('method'),
      url: $form.attr('action'),
      data: $form.serialize()
    })

    .done(function (response) {
      $('.message_wrapper').remove();
      
    })

    .fail(function (response) {
    })
  })




  $('.search_wrapper').on('click', '.show_message_form', function(event) {
    event.preventDefault();
    var $button = $(event.target);

    $.ajax({
      url: $button.attr('href'),
      data: {event: $button.attr('value')}
    })

    .done(function (response) {
      var results = response.match(/\d+/g);
      var num = results[1]
      $("#event_post" + num).append(response);
    })

    .fail(function (response) {
    })
  })

  $('.search_wrapper').on('submit', '.new_message', function(event) {
    event.preventDefault();
    var $form = $(event.target);

    $.ajax({
      method: $form.attr('method'),
      url: $form.attr('action'),
      data: $form.serialize()
    })

    .done(function (response) {
      $('.message_wrapper').remove();
      
    })

    .fail(function (response) {
    })
  })

  // function initialize() {
  // var mapOptions = {
  //   zoom: 8,
  //   center: new google.maps.LatLng(-34.397, 150.644)
  // };

  // var map = new google.maps.Map(document.getElementById('map-canvas'),
  //     mapOptions);
  // }

  // function loadScript() {
  //   var script = document.createElement('script');
  //   script.type = 'text/javascript';
  //   script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
  //       '&signed_in=true&callback=initialize';
  //   document.body.appendChild(script);
  // }

  // window.onload = loadScript;

});
