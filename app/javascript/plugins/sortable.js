import Sortable from 'sortablejs';

const initSortable = () => {
  console.log("test")
  const list = document.querySelector('.list_event')
  Sortable.create(list);
  // sortable.option("enable");
};

export { initSortable }
