# RAILS BODEGA

# Description

This is a fake New York Corner Store. You can go in the store, purchase items, and see everything you've purchased.

# Ruby Version

2.3.3

# Database Associations

Users
Has Many Items
Has Many Purchase Through Items

Items
Has Many Users
Has Many Users Through User Items

User Items
Belongs to Users
Belongs to Items


# Installation Instructions

1. git clone

2. bundle install

3. rake db:migrate

4. Run rake db:seed

5. rails s


# How to use Program

* Sign up, login if you already have an account, or login/sign up with your facebook login

* Click see items

* Click View Item to "buy"

* Hit Purchase


# Contributions

Bug reports and pull requests are welcome on GitHub at https://github.com/lekan20/Rails-Bodega/ This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

# License

The repo is available as open source under the terms of the MIT License.
