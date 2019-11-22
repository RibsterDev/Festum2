

const removeModal = document.querySelector('#remove-modal');

const effectModalEvent = () => {
  console.log('im here');
  const modalEvent = document.querySelector('.event-presentation')
  modalEvent.addEventListener('click',() => {
    document.querySelector('.modal-event').classList.add('active')
    document.querySelector('.modal-event').classList.add('fixed')
    removeModal.style.display = 'block';
  })
};

removeModal.addEventListener('click',() => {
  document.querySelector('.modal-event').classList.remove('active')
  document.querySelector('.modal-event').classList.remove('fixed')
  removeModal.style.display = 'none';
})


export { effectModalEvent };

// document.querySelector('.event-presentation').addEventListener('click', () => { document.querySelector('.modal-event').classList.add('active') })
