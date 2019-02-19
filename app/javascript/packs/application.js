import "bootstrap";
import InitUpdateNavbar from '../components/navbar';
import CardsHover from '../components/cards';
import 'mapbox-gl/dist/mapbox-gl.css';
import initMapbox from '../plugins/init_mapbox';
// import InitTyped from '../components/init_typed';

InitUpdateNavbar();
CardsHover();
// InitTyped();

initMapbox();
