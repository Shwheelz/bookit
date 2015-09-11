# bookit
Bookit is my first Ruby on Rails app created in Penn State's IST 297G - Introductory Design Studio.  The app would allow Penn State students to market their textbooks via listings.  It features full search functionality and an out of the box messaging solution.  

Installation
---------------
Clone the repository
````
git clone https://github.com/shwheelz/bookit
````

Install gem dependencies
````
bundle install
````

Run database migrations
````
rake db:migrate RAILS_ENV=development
````

Generate your secret key, paste it in secrets.sample.yml, then rename the file to secrets.yml
````
bundle exec rake secret
````

Start the rails server and begin selling!
````
rails s
````

Navigate to <a href="http://localhost:3000">http://localhost:3000</a> in any web browser

