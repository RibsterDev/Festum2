// const lis = document.querySelectorAll('h2')
// document.querySelector('.filter_js').addEventListener('click', () => {
//   const result = lis.filter()
// })


const categories = document.querySelectorAll('.category');
const events = document.querySelectorAll('.event-presentation');

categories.forEach((category) => {
  category.addEventListener('click', () => {
    const categoryName = category.dataset.category;
    events.forEach((event) => {
      if (categoryName == event.dataset.category) {
        event.style.display = 'block'
        // event.dataset.lat
        // event.dataset.long
      } else {
        event.style.display = 'none'
      }
    })
  })
})
