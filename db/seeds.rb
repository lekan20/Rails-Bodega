def create_items
	Item.create(name: "Doritos", price: 1.0, quantity: 10)
	Item.create(name: "Paper Towels 6 Rolls", price: 10.0, quantity: 10)
	Item.create(name: "Tide Liquid Detergent", price: 15.0, quantity: 10)
	Item.create(name: "Snickers Minis", price: 4.0, quantity: 10)
	Item.create(name: "Tortilla Chips", price: 4.0, quantity: 10)
	Item.create(name: "Oatly Oat Milk", price: 5.0, quantity: 10)
	Item.create(name: "Glad Zipper Food Storage bags", price: 3.0, quantity: 10)
end

def create_users
	User.create(name: "Oscar McCamey", password: "dog", money: 100)
	User.create(name: "Olive DeAngelis", password: "dog", money: 100, admin: true)
end

def create_user_items
	UserItem.create(user_id: 1, item_id: 1)
	UserItem.create(user_id: 1, item_id: 2)
	UserItem.create(user_id: 1, item_id: 3)
	UserItem.create(user_id: 1, item_id: 4)
	UserItem.create(user_id: 1, item_id: 5)

	UserItem.create(user_id: 2, item_id: 1)
	UserItem.create(user_id: 2, item_id: 2)
	UserItem.create(user_id: 2, item_id: 3)
	UserItem.create(user_id: 2, item_id: 4)
	UserItem.create(user_id: 2, item_id: 5)
end

def truncate_database
	User.delete_all
	Item.delete_all
	UserItem.delete_all

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
