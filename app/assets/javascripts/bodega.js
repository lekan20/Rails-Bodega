// $(function(){
//   $("a.items-link").on("click", function(e){
//     $.ajax({
//       method: "GET",
//       url: this.href
//     }).done(function(response) {
//       debugger;
//     })
//     e.preventDefault()
//   })
// })

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
