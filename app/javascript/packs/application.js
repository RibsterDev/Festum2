import "bootstrap";
// import '../css/application.css'

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
import '../plugins/filters';
import { initSortable } from '../plugins/sortable.js';
import './add_member.js'
import './flatpicker.js'
import '../plugins/win';

import { effectModalEvent } from '../plugins/modal_event';
import { removeInvitation } from '../plugins/vanishdiv';

effectModalEvent();
initMapbox();
initSortable();


// fonction mis en mode degueulasse pour l'alert quand un user rejoint le groupe

const messageFromServer = (data) => {
  console.log("===============")
  console.log("je suis dans messageFromServer")
  console.log(data)
  showFlashMessage(data.photo, data.flash_message)
}


const showFlashMessage = (photoMessage, flashMessage) => {
  const divMessage = `
    <div class="invitation alert-primary" role="alert">
      <img src="${photoMessage}"  class= "avatar-membre">
      ${flashMessage}
    </div>

  `
  const navbar = document.querySelector('.navbar')
  navbar.insertAdjacentHTML('afterend', divMessage)
  setTimeout(removeInvitation, 3000)
}

window.messageFromServer = messageFromServer




