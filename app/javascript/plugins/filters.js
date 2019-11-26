// const lis = document.querySelectorAll('h2')
// document.querySelector('.filter_js').addEventListener('click', () => {
//   const result = lis.filter()
// })


const categories = document.querySelectorAll('.filter');
const events = document.querySelectorAll('.event-presentation');

categories.forEach((filter) => {
  filter.addEventListener('click', () => {
    const categoryName = filter.dataset.category;
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
