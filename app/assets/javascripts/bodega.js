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
          <td> ${this.price} </td>
          <td> ${this.quantity} </td>
          <td><a href='/items/${this.id}'>Pick Up</a></td>
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
			$("div.cart").html(newUser.userHTML())
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

User.prototype.userHTML = function () {
  let itemQuantity = this.user_items.map((user_item) => {
    return (`
      <li>Quantity: ${user_item.quantity}</li>
    `)
  }).join('')
  // debugger;
	let userItems = this.items.map((item, index) => {
    // debugger;
    return (`
      <li>
			  <td>${item.name}</td>
        <td>$${item.price}</td>
      </li>
		`)
	}).join('')


	return (`
		<div>
      <ol>${userItems} </ol>
      ol>${itemQuantity}</ol>
    </div>

	`)
}
