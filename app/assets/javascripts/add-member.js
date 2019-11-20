let compteur = 0
function addMember() {
  compteur += 1
  d = document.querySelector('.email')
  d.insertAdjacentHTML('beforebegin',`<div id="mail-${compteur}"><input type="text" name="invit-email[]"/><a href="#" class="delete" onclick="removeDiv(${compteur})">Supprimer</a></div>`);
}

document.querySelector('#add-friend-input').addEventListener('click', (event) => {
  addMember()

  // document.querySelectorAll('.delete').forEach((deleteLink) => {
  //   if (!deleteLink.classList.contains('event-added')) {
  //     deleteLink.addEventListener('click', () => {


  //       d.remove(`mail-${compteur}`);

  //     })
  //     deleteLink.classList.add('event-added')
  //   }
  // })
})

function removeDiv(numb) {
  line = document.querySelector(`#mail-${numb}`);
  line.remove();
}



