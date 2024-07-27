# Curvify backend

#### Description:
Backend for the curvify website  
uses MUI  
instructions to run locally below  

## warning 
Developed and tested on macOS sonoma, login for cookies works on Chrome but not Safari  

### pre-requisites
install ruby 3.3.1 with rbenv  
(https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-macos)  
install postgresql version 13  
(brew install postgresql@13  
brew services start postgresql@13)  
### step 1  
install rails
```
sudo gem install rails
```
### step 2  
install bundles using bundler
```
bundle install
```
### step 3
configure database with seeded data

```
 rake db:drop db:create db:schema:load 
```
### step 4 
seed Db
```
rails db:seed
```
