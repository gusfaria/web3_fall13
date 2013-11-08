$('.stationname').click(function(){
		clearMarkers();
    $(this).siblings($('div.stationinfo')).slideToggle('fast');
    var longitude = $(this).siblings().children('div.longitude').text();
    var latitude = $(this).siblings().children('div.latitude').text();
    
    var addlatlong = new google.maps.LatLng(latitude, longitude);  
    var mapOptions = {
        zoom: 18,
        center: addlatlong,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
    addMarker(addlatlong);
});

var map;
var markers = [];

function initialize() {
  var ny = new google.maps.LatLng(40.721659, -73.997250);
  var mapOptions = {
    zoom: 13,
    center: ny,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
}

// Add a marker to the map and push to the array.
function addMarker(location) {
  var marker = new google.maps.Marker({
    position: location,
    map: map
  });
  markers.push(marker);
}

// Sets the map on all markers in the array.
function setAllMap(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
  setAllMap(null);
}

// Shows any markers currently in the array.
function showMarkers() {
  setAllMap(map);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
  clearMarkers();
  markers = [];
}

google.maps.event.addDomListener(window, 'load', initialize);

