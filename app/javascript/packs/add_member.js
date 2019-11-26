let compteur = 0

function addMember() {
  compteur += 1
  d = document.querySelector('.email')
  d.insertAdjacentHTML('afterend',`<div id="mail-${compteur}"><input type="text" name="invit-email[]" class="toto"/><a class="delete" onclick="removeDiv(${compteur})" style="color: #F44336;">Supprimer</a></div>`);
}

const addFriendInput = document.querySelector('#add-friend-input')

if (addFriendInput) {
  addFriendInput.addEventListener('click', (event) => {
    addMember()

    document.querySelectorAll('.delete').forEach((deleteLink) => {
      if (!deleteLink.classList.contains('event-added')) {
        deleteLink.addEventListener('click', () => {
          deleteLink.parentElement.remove();
        })
        deleteLink.classList.add('event-added')
      }
    })
  })
}
