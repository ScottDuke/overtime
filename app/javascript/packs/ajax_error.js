$(document).on("ajax:error", "form", function (event) {
  $('#app-errors').hide();
  $('#app-errors').html("")
  var errors, message, results = [];
  errors = event.detail[0].errors;
  var flash_message = event.detail[0].flash_message
  console.log(errors)
  $('#app-errors').append("<ul />")

  for (message in errors) {
    results.push($('#app-errors ul').append('<li>' + errors[message] + '</li>'));
  }

  $('#app-errors').append(results);
  $('#app-errors').fadeIn(2000);

  Toastify({
    text: flash_message,
    backgroundColor: "linear-gradient(to right, rgba(247,100,74,1) 0%,rgba(231,56,39,1) 100%)",
    duration: 20000,
    gravity: "bottom",
    position: "right",
    close: true
  }).showToast();
});