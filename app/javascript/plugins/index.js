import { initSortable } from 'sortable.js';

initSortable();

const event = document.querySelector('#event_choices');

event.addEventListener('click', () => {
  const value = document.querySelector('#query').value;
});
