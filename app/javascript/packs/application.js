import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
import '../plugins/filters';
import { initSortable } from '../plugins/sortable.js';
import './add_member.js'

initMapbox();
initSortable();


import { effectModalEvent } from '../plugins/modal_event';
effectModalEvent();



