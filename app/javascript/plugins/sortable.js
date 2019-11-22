import Sortable from 'sortablejs';

const initSortable = () => {
  const list = document.querySelector('.list_event')
  Sortable.create(list);
};

export { initSortable }
