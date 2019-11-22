function addFields(){
    var number = document.getElementById("member").value;
    var container = document.getElementById("container");
    while (container.hasChildNodes()) {
        container.removeChild(container.lastChild);
    }
    for (i=0;i<number;i++){
        container.appendChild(document.createTextNode("Member " + (i+1)));
        var input = document.createElement("input");
        input.type = "text";
        container.appendChild(input);
        container.appendChild(document.createElement("br"));
    }
}

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



