import "bootstrap";

import { InitUpdateNavbar, fixNavbar } from '../components/navbar';
import initTabs from '../components/tabs';
import CardsHover from '../components/cards';
import 'mapbox-gl/dist/mapbox-gl.css';
import initMapbox from '../plugins/init_mapbox';
// import datePicker from '../components/datepicker';
// import InitTyped from '../components/init_typed';
import initAutocomplete from '../plugins/init_autocomplete';
// import InitTyped from '../components/init_typed';

InitUpdateNavbar();
if (window.location.pathname != "/" && window.location.pathname != "/trips/new") { fixNavbar() }
initTabs(initMapbox);

CardsHover();

initAutocomplete();
