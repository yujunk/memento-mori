var DOCUMENTTYPEARRAY = ["identity_card", "driver_license", "passport", "birth_certificate", "work_permit_or_visa", "military_identity_card", "police_identity_card"];

function displayNonePrevious() {
  i = 0;
  while (i < DOCUMENTTYPEARRAY.length) {
    var documentType = document.getElementById(DOCUMENTTYPEARRAY[i])
    documentType.style.display = "none";
    i++;
  }
}

var selector = document.getElementById("inputGroupSelect01");
selector.onchange = handleSelectChange;

function handleSelectChange(event) {
  var selectElement = event.target;
  var value = selectElement.value;
    
  if(value=="identity_card")
    {
      displayNonePrevious();
      $("#identity_card").show();
    }
  

  else if(value=="driver_license")
    {
      displayNonePrevious();
      $("#driver_license").show();
    }

  else if(value=="passport")
    {
      displayNonePrevious();
      $("#passport").show();
    }

  else if(value=="birth_certificate")
  {
    displayNonePrevious();
    $("#birth_certificate").show();
  }

  else if(value=="work_permit_or_visa")
    {
      displayNonePrevious();
      $("#work_permit_or_visa").show();
    }
  
  else if(value=="military_identity_card")
    {
      displayNonePrevious();
      $("#military_identity_card").show();
    }
  else if(value=="police_identity_card")
    {
      displayNonePrevious();
      $("#police_identity_card").show();
    }
  else
    {
      displayNonePrevious();
      $("#other").show();
    }
}



//TESTING OUT JAVASCRIPT

// var selector = document.getElementById("inputGroupSelect01");
// selector.onchange = handleSelectChange;

// function handleSelectChange(event) {
//     var selectElement = event.target;
//     var value = selectElement.value;
//     alert(value);
// }

// AIMAN'S WAY
// function checkDisplayNone(element) {
//   element.style.display === "none"
// }

// else if(value="birth_certificate")
//     {
      // if(!checkDisplayNone(DOCUMENTTYPE) ){
      //   DOCUMENTTYPE.style.display = "none";
      //   $("#birth_certificate").show();
      // }
    // }


// https://stackoverflow.com/questions/5416767/get-selected-value-text-from-select-on-change
