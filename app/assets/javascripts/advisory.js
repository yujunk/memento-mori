//https://medium.com/@limichelle21/integrating-google-maps-api-for-multiple-locations-a4329517977a
// ONE MARKER
// var map;
//   function initMap() {
//     var center = {lat: 41.8781, lng: -87.6298};

//     map = new google.maps.Map(document.getElementById('map'), {
//       zoom: 10,
//       center: center
//     });

//     var marker = new google.maps.Marker({
//       position: center,
//       map: map
//     });
//   }

// MULTIPLE MARKERS - NOT WORKING?

// var center = {lat: 41.8781, lng: -87.6298};

// var locations = [
//       ['Bondi Beach', -33.890542, 151.274856, 4],
//       ['Coogee Beach', -33.923036, 151.259052, 5],
//       ['Cronulla Beach', -34.028249, 151.157507, 3],
//       ['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
//       ['Maroubra Beach', -33.950198, 151.259302, 1]
//     ];

// var map = new google.maps.Map(document.getElementById('map'), {
//     zoom: 10,
//     center: center
//   });

// var infowindow = new google.maps.InfoWindow();

// var marker, i;

// for (i = 0; i < locations.length; i++) {  
//   marker = new google.maps.Marker({
//     position: new google.maps.LatLng(locations[i][1], locations[i][2]),
//     map: map
//   });

//   google.maps.event.addListener(marker, 'click', (function(marker, i) {
//     return function() {
//       infowindow.setContent(locations[i][0]);
//       infowindow.open(map, marker);
//     }
//   })(marker, i));
// }


function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 11.5,
    center: {lat: 41.936857, lng: -87.741627}
  });

  setMarkers(map);

}

// Data for the markers consisting of a name, a LatLng and a zIndex for the
// order in which these markers should display on top of each other.
var funeraryhomes = [
  ['Colonial-Wojciechowski Funeral Home', 42.001367, -87.784941],
  ['Smith-Corcoran Funeral Homes', 41.997982, -87.747917],
  ['Barr Funeral Home', 41.999907, -87.661129],
  ['Lakeview Funeral Home', 41.944562, -87.666053],
  ['Michalik Funeral Home', 41.900840, -87.654437],
  ['Casey Laskowski Funeral Home', 41.936857, -87.741627]
];

function setMarkers(map) {
  // Adds markers to the map.

  // Marker sizes are expressed as a Size of X,Y where the origin of the image
  // (0,0) is located in the top left of the image.

  // Origins, anchor positions and coordinates of the marker increase in the X
  // direction to the right and in the Y direction down.
  var image = {
    url: 'memento_mori/assets/images/candles.png',
    // This marker is 20 pixels wide by 32 pixels high.
    size: new google.maps.Size(20, 32),
    // The origin for this image is (0, 0).
    origin: new google.maps.Point(0, 0),
    // The anchor for this image is the base of the flagpole at (0, 32).
    anchor: new google.maps.Point(0, 32)
  };
  // Shapes define the clickable region of the icon. The type defines an HTML
  // <area> element 'poly' which traces out a polygon as a series of X,Y points.
  // The final coordinate closes the poly by connecting to the first coordinate.
  var shape = {
    coords: [1, 1, 1, 20, 18, 20, 18, 1],
    type: 'poly'
  };
  for (var i = 0; i < funeraryhomes.length; i++) {
    var funeraryhome = funeraryhomes[i];
    var marker = new google.maps.Marker({
      position: {lat: funeraryhome[1], lng: funeraryhome[2]},
      map: map,
      // icon: image,
      shape: shape,
      title: funeraryhome[0],
      zIndex: funeraryhome[3]
    });
  }
}

//https://developers.google.com/maps/documentation/javascript/markers