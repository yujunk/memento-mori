//TESTING METHOD 1 - TRYING TO USE AJAX TO GET RIGHT COLUMN FORMS (FULL JQUERY):
// $("inputGroupSelect01").onchange(function(event) {
//   $.ajax({
//   $("#formAjax").html("");
//   $("<%= escape_javascript(  render partial: 'vital_documents/ajax_form')%>").appendTo("#formAjax");
    // $("formAjax").append("<%= j render partial: 'vital_documents/ajax_form' %>");
//   });
// });

//TESTING METHOD 2 - TRYING TO USE AJAX TO GET RIGHT COLUMN FORMS (MIX OF JS & JQUERY):
// var selector = document.getElementById("inputGroupSelect01");
// selector.onchange = handleSelectChange;

// function handleSelectChange(event) {
//     $.ajax(event, {

//     })
//     var value = selectElement.value;
//     alert(value);
// }


//THIS WORKS - TO IDENTIFY SELECTOR - BUT NOT COMPLETE:
var selector = document.getElementById("inputGroupSelect01");
selector.onchange = handleSelectChange;

function handleSelectChange(event) {
    var selectElement = event.target;
    debugger
    var value = selectElement.value;
    alert(value);
}




// https://stackoverflow.com/questions/5416767/get-selected-value-text-from-select-on-change
