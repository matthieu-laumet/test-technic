const actionModal = () => {
  const modalBtn = document.querySelector('.modal-btn');
  const modalBg = document.querySelector('.modal-bg');
  const modalClose = document.querySelector('.modal-close');

  if (modalBtn) {
    modalBtn.addEventListener('click', (event) => {
      modalBg.classList.add('bg-active');
    })
  }

  if (modalClose) {
    modalClose.addEventListener('click', (event) => {
      modalBg.classList.remove('bg-active');
    })
  }
}

export { actionModal };
