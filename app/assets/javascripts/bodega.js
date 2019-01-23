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
        $("div.items-to-purchase").append(newList.formatIndex())
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

List.prototype.formatIndex = function() {
    return (`
      <tbody>
        <tr>
          <td> ${this.name} </td>
          <td> $${this.price}  </td>
          <td> ${this.quantity} </td>
          <td><a href='/items/${this.id}'> View Item</a></td>
        </tr>
      </tbody>
    `)
}


$(function () {
	$("a.see-cart").on("click", function (e) {
		$.ajax({
			method: "GET",
			url: this.href,
			dataType: 'json'
		}).done(function (response) {

			let newUser = new User(response)
			$("div.cart").html(newUser.cartHTML())
		});
		e.preventDefault();
	})
})

class User {
	constructor(obj) {
		this.id = obj.id
		this.name = obj.name
		this.money = obj.money
		this.items = obj.items
		this.admin = obj.admin
    this.user_items = obj.user_items
	}
}

User.prototype.cartHTML = function () {
  let itemQuantity = this.user_items.map((user_item) => {
    return (`
      <li>${user_item.quantity}</li>
    `)
  }).join('')

	let userItems = this.items.map((item, index) => {

    return (`
      <li>
			  <td>${item.name}</td>
      </li>
		`)
	}).join('')

  let itemPrice = this.items.map((item, index) => {
    return (`
      <li>
        <td>$${item.price}</td>
      </li>
    `)
  }).join('')


	return (`
    <div class="container-1">

        <ol> <strong>Items</strong> ${userItems}</ol>
        <ul style="list-style: none;"> <strong>Price</strong> ${itemPrice}</ul>
        <ul style="list-style: none;"> <strong>Quantity</strong> ${itemQuantity}</ul>
    </div>

	`)
}
