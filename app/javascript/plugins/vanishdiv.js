

const removeInvitation = () => {
  const invit = document.querySelector('.invitation')
  if (invit) {
    invit.classList.add('move');
  }
}

export { removeInvitation }

