

const removeModal = document.querySelector('#remove-modal');

const effectModalEvent = () => {
  console.log('im here');
  const modalEvent = document.querySelectorAll('.event-presentation')
  modalEvent.forEach((event) => {
    event.addEventListener('click',() => {
      const id = event.dataset.id;
      document.querySelector(`#modal-${id}`).classList.add('active')
      removeModal.style.display = 'block';
    })

  })
};

removeModal.addEventListener('click',() => {
  document.querySelector('.modal-event.active').classList.remove('active')
  removeModal.style.display = 'none';
})


export { effectModalEvent };

// document.querySelector('.event-presentation').addEventListener('click', () => { document.querySelector('.modal-event').classList.add('active') })
