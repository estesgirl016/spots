$(document).ready(function() {
  $('.attachinary-input').attachinary();

  var spotId = $('#spot').data('id');
  if (spotId !== undefined) {
    $.ajax({
      url: '/spots/' + spotId + '/lat_long',
      type: 'GET',
      dataType: 'JSON'
    }).done( function(data) {
      handler = Gmaps.build('Google');
      handler.buildMap({internal: {id: 'map'}},
        function(){
        markers = handler.addMarkers([
          {
            "lat": data.lat,
            "lng": data.long
          }
        ]);
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
        handler.getMap().setMapTypeId('terrain');
        handler.getMap().setZoom(12);
      });
    }).fail( function(data) {
      console.log(data);
    });
  }
});
