// google maps

//$(function(){
//  var city = new google.maps.LatLng($('#map_canvas').data('lat'), $('#map_canvas').data('long'));
//  var theEvent = new google.maps.LatLng($('#map_canvas').data('lat'), $('#map_canvas').data('long'));
  //var city = new google.maps.LatLng(result[0][1], result[0][2]);
  //var theEvent = new google.maps.LatLng(result[0][1], result[0][2]);
  var city = new google.maps.LatLng(47.710369, -122.549111);
  //var marker;
  var map;
  var data = {};

function initialize() {
  var mapOptions = {
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    center: city
  };

  map = new google.maps.Map(document.getElementById('map_canvas'),
          mapOptions);

//  marker = new google.maps.Marker({
 //   map:map,
 //   draggable:false,
  //  animation: google.maps.Animation.DROP,
  //  position: theEvent
 // });
  //google.maps.event.addListener(marker, 'click', toggleBounce);
};

function toggleBounce() {

  if (marker.getAnimation() != null) {
    marker.setAnimation(null);
  } else {
    marker.setAnimation(google.maps.Animation.BOUNCE);
  }
};

$.ajax({
  type: "get",
  url: "locationjson",
  dataType: "json",
  success: function(data) {
    var marker;
    //alert(data[0]);
    for (var i = 0; i < data.length; i++) {
      console.log(data[i]);
      console.log(data[i][1]);
      new google.maps.Marker({
        map:map,
        draggable:false,
        animation: google.maps.Animation.DROP,
        position: new google.maps.LatLng(data[i][1],data[i][2])
    });
    }
  }

});
//})