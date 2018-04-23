//No need for AJAX. Just JS

// var selector = document.getElementById("inputGroupSelect01");
// selector.onchange = handleSelectChange;

// function handleSelectChange(event) {
//     var selectElement = event.target;
//     var value = selectElement.value;
//     alert(value);
// }

var IDENTITYCARD;

function checkShow(element) {
  element.style.display === "none"
}


var selector = document.getElementById("inputGroupSelect01");
selector.onchange = handleSelectChange;

function handleSelectChange(event) {
  var selectElement = event.target;
  var value = selectElement.value;

  console.log(value)

  // $("#formAppear").hide();
    
  if(value=="identity_card")
    {
      IDENTITYCARD = document.getElementById("identity_card")
      IDENTITYCARD.style.display = "";
    }
  else if(value="birth_certificate")
    {
      if(!checkShow(IDENTITYCARD) ){
        $("#identity_card").hide()
        $("#birth_certificate").show();
      }
    }
  else if(value="driver_license")
  {
    $("#driver_license").show();
  }
  else if(value="passport")
  {
    $("#passport").show();
  }
  else if(value="work_permit_or_visa")
  {
    $("#work_permit_or_visa").show();
  }
  else if(value="military_identity_card")
  {
    $("#military_identity_card").show();
  }
  else if(value="police_identity_card")
  {
    $("#police_identity_card").show();
  }
  else
  {
    $("#other").show();
  }
}






// https://stackoverflow.com/questions/5416767/get-selected-value-text-from-select-on-change
