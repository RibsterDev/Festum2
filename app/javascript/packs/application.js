import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
import '../plugins/filters';
import { initSortable } from '../plugins/sortable.js';
import './add_member.js'
import './flatpicker.js'


import { effectModalEvent } from '../plugins/modal_event';

effectModalEvent();

initMapbox();
initSortable();



// fonction mis en mode degueulasse pour l'alert quand un user rejoint le groupe

const messageFromServer = (data) => {
  console.log("===============")
  console.log("je suis dans messageFromServer")
  notifUser(data.user)
}


const notifUser = (user) => {
  alert(`${user.email} a rejoint le groupe !`)
}

window.messageFromServer = messageFromServer


