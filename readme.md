# Curvify backend

#### Description:
Backend for the curvify website  
uses MUI  
works with frontend: github.com/travisim/Curvify-Frontend

### Warning 
Developed and tested on macOS sonoma  
## Instructions

### Pre-requisites
install ruby 3.3.1 with rbenv  
(https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-macos)  
install postgresql version 13  
(brew install postgresql@13  
brew services start postgresql@13)  

### Step 1  
Clone repository
```
git clone https://github.com/travisim/Curvify-Backend.git
```

### Step 2
Install rails
```
sudo gem install rails
```
### Step 3
Install bundles using bundler
```
bundle install
```
### Step 4
Configure database with seeded data

```
 rake db:drop db:create db:schema:load 
```
### Step 5
Seed Db
```
rails db:seed
```
