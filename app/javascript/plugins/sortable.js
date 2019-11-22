import Sortable from 'sortablejs';

const initSortable = () => {
  console.log("test")
  const list = document.querySelector('.list_event')
  Sortable.create(list);
  // sortable.option("enable");
};


console.log("ertyh");


const lea = document.querySelector('.valid-vote');
lea.addEventListener("click", (event) => {
  event.preventDefault()
  const lis = document.querySelector(".list_event").getElementsByTagName("li");
  console.log(lis)
});

$.ajax({
        url : "/groups/:group_id/votes",
        type : "post",
        data : { votes_result: JSON.stringify(lis) }
    });

// console.log(lis);
// var lis = document.getElementById(".list_event").getElementsByTagName("li");
// var order = sortable.toArray();
// sortable.sort(order.reverse());

export { initSortable }
