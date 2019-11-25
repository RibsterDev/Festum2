import Sortable from 'sortablejs';

const initSortable = () => {
  const list = document.querySelector('.list_event')

  if (list) {
    new Sortable(list, {
      onEnd: (evt) => {
        console.log(list.querySelectorAll('li'))
        console.log("je suis la")
        const itemEl = evt.newIndex;
        console.log(itemEl)
        return itemEl;
      }
    })
  }
};

export { initSortable }
