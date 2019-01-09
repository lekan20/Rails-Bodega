$(function(){
  $("a.items-link").on("click", function(e){
    $.ajax({
      method: "GET",
      url: this.href,
      dataType: 'json'
    }).done(function(response) {
      getItems()
    })
    e.preventDefault()
  })
})

const getItems = () => {
  fetch('/items.json')
    .then(res => res.json())
    .then(items => {
      items.forEach((item) => {
        let newList = new List(item)
        // $("div.items-to-purchase").html(newList.listHTML()) - start here 1/10
        debugger;
      })
    })
}

class List {
  constructor(obj) {
    this.id = obj.id
    this.name = obj.name
    this.price = obj.price
    this.quantity = obj.quantity
  }
}

List.prototype.listHTML = function() {
    return (`
      <li>${this.name}</li>
      <li>${this.price}</li>
      <li>${this.quantity}</li>
    `)
}





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
