// $(function(){
//   $("a.items-link").on("click", function(e){
//     $.ajax({
//       method: "GET",
//       url: this.href,
//       dataType: 'json'
//     }).done(function(response) {
//       let itemList = new List(response)
//       debugger;
//     })
//     e.preventDefault()
//   })
// })
//
// class List {
//   constructor(obj) {
//     debugger;
//   }
// }

$(function() {
  $("a.see_cart").on("click", function(e){
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function( response ) {

      $("div.cart").html(response)
  });
    e.preventDefault();
  })
})
