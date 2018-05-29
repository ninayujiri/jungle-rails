# Jungle

A mini e-commerce application built with Rails 4.2. Added to an existing code-base and implemented new features:

**Sold Out Badge**: Implemented boolean function to display badge when inventory is at zero.
**Admin Categories**: Created restful routes to be able to create new categories within the admin namespace.
**User Authentication**: User is able to signup/login to Jungle where password is encrypted and email is validated through uniqueness.
**Enhanced Order Page**: Order details shown with image, description, quantity and cart total upon successful payment.
**Confirmation Email**: Email is sent to user to confirm purchase with order details.
**Product Ratings**: Users logged in are able to leave reviews for each product and can delete reviews. Visitors are able to see product ratings, but must be logged in to leave a review.


## Final Product

Check out the live demo on [Heroku](https://jungle-rails-app.herokuapp.com/).


Checkout process:
!["GIF of Checkout Process"](https://github.com/ninayujiri/jungle-rails/blob/master/docs/cart-checkout.gif?raw=true)


Reviews Process:
!["GIF of Reviews Process"](https://github.com/ninayujiri/jungle-rails/blob/master/docs/cart-reviews.gif?raw=true)


Admin Pages:
!["Screenshot of Admin Products Page"](https://github.com/ninayujiri/jungle-rails/blob/master/docs/admin-products.png?raw=true)

!["Screenshot of Admin Categories Page"](https://github.com/ninayujiri/jungle-rails/blob/master/docs/admin-categories.png?raw=true)


## Getting Started

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server


## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>


## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
