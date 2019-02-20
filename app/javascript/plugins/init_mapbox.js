// app/javascript/plugins/init_mapbox.js
import 'mapbox-gl/dist/mapbox-gl.css';
import mapboxgl from 'mapbox-gl';

const initMapbox = () => {

  // const markerHeight = 50, markerRadius = 10, linearOffset = 25;
  // const popupOffsets = {
  //  'top': [0, 0],
  //  'top-left': [0,0],
  //  'top-right': [0,0],
  //  'bottom': [0, -markerHeight],
  //  'bottom-left': [linearOffset, (markerHeight - markerRadius + linearOffset) * -1],
  //  'bottom-right': [-linearOffset, (markerHeight - markerRadius + linearOffset) * -1],
  //  'left': [markerRadius, (markerHeight - markerRadius) * -1],
  //  'right': [-markerRadius, (markerHeight - markerRadius) * -1]
  //  };

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
  };

  const addMarkersToMap = (map, markers) => {
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // <-- add this
      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '25px';
      element.style.height = '25px';

      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });
  }

  ////////// Flow //////////

  const mapElement = document.getElementById('map');

  if (mapElement == null) {return ;} // only build a map if there's a div#map to inject into

  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });

  const markers = JSON.parse(mapElement.dataset.markers);

  addMarkersToMap(map, markers);
  fitMapToMarkers(map, markers);

  // Add zoom and rotation controls to the map.
  map.addControl(new mapboxgl.NavigationControl());
};

export default initMapbox ;
