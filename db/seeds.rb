def create_items
	Item.create(name: "Doritos", price: 1.0, quantity: 10)
	Item.create(name: "Paper Towels 6 Rolls", price: 10.0, quantity: 10)
	Item.create(name: "Tide Liquid Detergent", price: 15.0, quantity: 10)
	Item.create(name: "Snickers Minis", price: 4.0, quantity: 10)
	Item.create(name: "Tortilla Chips", price: 4.0, quantity: 10)
	Item.create(name: "Oatly Oat Milk", price: 5.0, quantity: 10)
	Item.create(name: "Glad Zipper Food Storage bags", price: 3.0, quantity: 10)
	Item.create(name: "Bananas", price: 1.0, quantity: 10)
	Item.create(name: "Toilet Paper", price: 7.0, quantity: 10)
	Item.create(name: "Protein Bars", price: 3.0, quantity: 10)
end

def create_users
	User.create(name: "Oscar McCamey", password: "dog", money: 100)
	User.create(name: "Olive DeAngelis", password: "dog", money: 100, admin: true)
end

def create_user_items
	UserItem.create(user_id: 1, item_id: 1, quantity: 2)
	UserItem.create(user_id: 1, item_id: 2, quantity: 5)
	UserItem.create(user_id: 1, item_id: 3, quantity: 3)
	UserItem.create(user_id: 1, item_id: 4, quantity: 3)
	UserItem.create(user_id: 1, item_id: 5, quantity: 3)

	UserItem.create(user_id: 2, item_id: 1, quantity: 4)
	UserItem.create(user_id: 2, item_id: 2, quantity: 4)
	UserItem.create(user_id: 2, item_id: 3, quantity: 4)
	UserItem.create(user_id: 2, item_id: 4, quantity: 4)
	UserItem.create(user_id: 2, item_id: 5, quantity: 4)
end

def truncate_database
  UserItem.delete_all
	User.delete_all
	Item.delete_all

	# these methods reset the ID back to 0 if you are using Sqlite3 database
	connection = ActiveRecord::Base.connection()
	connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME='users';")
	connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME='items';")
	connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME='user_items';")

	# these methods reset the ID back to 0 if you are using PostgreSQL database
	# ActiveRecord::Base.connection.reset_pk_sequence!('users')
	# ActiveRecord::Base.connection.reset_pk_sequence!('items')
	# ActiveRecord::Base.connection.reset_pk_sequence!('user_items')
end

def main
	truncate_database
	create_items
	create_users
	create_user_items
end

main
