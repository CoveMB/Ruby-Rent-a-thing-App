import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';

import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initFilter } from './plugins/filter';
import { initMapbox } from './plugins/mapbox';

initMapbox();
initFilter();
