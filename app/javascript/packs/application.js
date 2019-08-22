import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initFilter } from './plugins/filter';
import { initMapbox } from './plugins/mapbox';

initMapbox();
initFilter();
