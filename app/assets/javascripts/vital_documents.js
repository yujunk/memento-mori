var expiryDateNeededArray = ["driver_license", "passport", "work_permit_or_visa", "other"];

function expiryDateNeededItems(documentType) {
  i = 0;
  while (i < expiryDateNeededArray.length) {
    if (documentType == expiryDateNeededArray[i])
      { 
        $("#expiration_date_display").show();
        break;
      }
    else { $("#expiration_date_display").hide(); }
    i++;
  }
}

var selector = document.getElementById("inputGroupSelect01");
selector.onchange = handleSelectChange;

function handleSelectChange(event) {
  $("#all_documents_display").show();

  var selectElement = event.target;
  var value = selectElement.value;
    
  if(value=="identity_card")
    {
      $("#document_type_name_display").html("");
      $("#document_type_name_display").append("<label for=\"identity_card\">IC Number: </label>");
      expiryDateNeededItems(value);
    }

  else if(value=="driver_license")
    {
      $("#document_type_name_display").html("");
      $("#document_type_name_display").append("<label for=\"driver_license\"> License Number: </label>");
      expiryDateNeededItems(value);

    }

  else if(value=="passport")
    {
      $("#document_type_name_display").html("");
      $("#document_type_name_display").append("<label for=\"passport\"> Passport Number: </label>");
      expiryDateNeededItems(value);
    }

  else if(value=="birth_certificate")
  {
    $("#document_type_name_display").html("");
    $("#document_type_name_display").append("<label for=\"birth_certificate\"> Birth Cert Number: </label>");
    expiryDateNeededItems(value);
  }

  else if(value=="work_permit_or_visa")
    {
      $("#document_type_name_display").html("");
      $("#document_type_name_display").append("<label for=\"work_permit_or_visa\"> ID Number: </label>");
      expiryDateNeededItems(value);
    }
  
  else if(value=="military_identity_card")
    {
      $("#document_type_name_display").html("");
      $("#document_type_name_display").append("<label for=\"military_identity_card\"> Member Number: </label>");
      expiryDateNeededItems(value);
    }
  else if(value=="police_identity_card")
    {
      $("#document_type_name_display").html("");
      $("#document_type_name_display").append("<label for=\"police_identity_card\"> Member Number: </label>");
      expiryDateNeededItems(value);
    }
  else if(value=="tax_identity")
    {
      $("#document_type_name_display").html("");
      $("#document_type_name_display").append("<label for=\"tax_identity\"> Tax Registration Number: </label>");
      expiryDateNeededItems(value);
    }
  else
    {
      $("#document_type_name_display").html("");
      $("#document_type_name_display").append("<label for=\"driver_license\"> License Number: </label>");
      expiryDateNeededItems(value);
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

// PART OF PREVIOUS ATTEMPT
// var DOCUMENTTYPEARRAY = ["identity_card", value, "passport", "birth_certificate", "work_permit_or_visa", "military_identity_card", "police_identity_card"];

// function displayNonePrevious() {
//   i = 0;
//   while (i < DOCUMENTTYPEARRAY.length) {
//     var documentType = document.getElementById(DOCUMENTTYPEARRAY[i])
//     documentType.style.display = "none";
//     i++;
//   }
// }

// https://stackoverflow.com/questions/5416767/get-selected-value-text-from-select-on-change
