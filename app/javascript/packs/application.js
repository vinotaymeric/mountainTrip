import "bootstrap";

import { InitUpdateNavbar, fixNavbar, whiteLogo, greyLogo } from '../components/navbar';
import initTabs from '../components/tabs';
import CardsHover from '../components/cards';
import CardsItiHover from '../components/cardsIti';
import search from '../components/search';
import 'mapbox-gl/dist/mapbox-gl.css';
import initMapbox from '../plugins/init_mapbox';
import initAutocomplete from '../plugins/init_autocomplete';

InitUpdateNavbar();
if (window.location.pathname != "/" && window.location.pathname != "/trips/new") {
  fixNavbar();
  } else{
    whiteLogo();
  }

initTabs(initMapbox);

CardsHover();
CardsItiHover();


initAutocomplete();

search();
