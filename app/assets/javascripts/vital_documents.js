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
    
  if(value=="Identity Card")
    {
      $("#document_type_name_display").html("");
      $("#document_type_name_display").append("<label for=\"Identity Card\">IC Number: </label>");
      expiryDateNeededItems(value);
    }

  else if(value=="Driver's License")
    {
      $("#document_type_name_display").html("");
      $("#document_type_name_display").append("<label for=\"Driver's License\"> License Number: </label>");
      expiryDateNeededItems(value);

    }

  else if(value=="Passport")
    {
      $("#document_type_name_display").html("");
      $("#document_type_name_display").append("<label for=\"Passport\"> Passport Number: </label>");
      expiryDateNeededItems(value);
    }

  else if(value=="Birth Certificate")
  {
    $("#document_type_name_display").html("");
    $("#document_type_name_display").append("<label for=\"Birth Certificate\"> Birth Cert Number: </label>");
    expiryDateNeededItems(value);
  }

  else if(value=="Work Permit or Visa")
    {
      $("#document_type_name_display").html("");
      $("#document_type_name_display").append("<label for=\"Work Permit or Visa\"> ID Number: </label>");
      expiryDateNeededItems(value);
    }
  
  else if(value=="Military Identity Card")
    {
      $("#document_type_name_display").html("");
      $("#document_type_name_display").append("<label for=\"Military Identity Card\"> Member Number: </label>");
      expiryDateNeededItems(value);
    }
  else if(value=="Police Identity Card")
    {
      $("#document_type_name_display").html("");
      $("#document_type_name_display").append("<label for=\"Police Identity Card\"> Member Number: </label>");
      expiryDateNeededItems(value);
    }
  else if(value=="Tax Identity")
    {
      $("#document_type_name_display").html("");
      $("#document_type_name_display").append("<label for=\"Tax Identity\"> Tax Registration Number: </label>");
      expiryDateNeededItems(value);
    }
  else
    {
      $("#document_type_name_display").html("");
      $("#document_type_name_display").append("<label for=\"Other\"> Identification Number: </label>");
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
