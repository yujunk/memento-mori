//No need for AJAX. Just JS

// var selector = document.getElementById("inputGroupSelect01");
// selector.onchange = handleSelectChange;

// function handleSelectChange(event) {
//     var selectElement = event.target;
//     var value = selectElement.value;
//     alert(value);
// }

var DOCUMENTTYPE;

function checkDisplayNone(element) {
  element.style.display === "none"
}

var DOCUMENTTYPEARRAY = ["identity_card", "driver_license", "passport", "birth_certificate", "work_permit_or_visa", "military_identity_card", "police_identity_card"]

var selector = document.getElementById("inputGroupSelect01");
selector.onchange = handleSelectChange;

function handleSelectChange(event) {
  var selectElement = event.target;
  var value = selectElement.value;
    
  if(value=="identity_card")
    {
      // while (i < DOCUMENTTYPEARRAY.length) {
        
      // }
      DOCUMENTTYPE = document.getElementById("identity_card")
      DOCUMENTTYPE.style.display = "";

      $("#identity_card").show();
    }
  else if(value="birth_certificate")
    {
      if(!checkDisplayNone(DOCUMENTTYPE) ){
        DOCUMENTTYPE.style.display = "none";
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
