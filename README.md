# SoftX_Jogging

SoftX_Jogging is a backend for creating and handling users and their joffing times :). It was created using Ruby on Rails and provides a back-end API for managing users and jogging times.

Installation

In order to run this project you need

> 1 - ruby

> 2 - rails

> 3 - PostgreSQL

> 4 - capybara

### Prerequisites

In order to run this project you need:

  - linters.yml and tests.yml files inside the .github folder
  - .rubocop.yml file
  - Gemfile 
  - Install rails and required gems 

### Setup
Clone this repository to your desired folder:

> 1- Ruby v 3.1.3

> 2- rails

## Install

Install this project with:

### Usage

To run the project, execute the following command:

> 1 - bundle install

> 2 - rails db:create db:migrate

> 3 - rails s
 
> 4 -user "http://localhost:3000/" to communicate with the server

here are the end-points


> For this demonstration I used Thunder client

# user

Endpoint  | Method | Description | ex
------------- | ------------- | ------------- | -------------
/signup  | POST | This create a user. return a token |    "user": {   "email": "user@example.com",   "password": "12345678",  "role": "user" }}
/logout  | DELETE | this revokes the token |  N/A
/users/login  | POST | This gets the new token if the user loggedout. NOTE: don’t forget to remove the Authorization from the header before send the post requset | {  "user": {    "email": user@example.com",    "password": "12345678"  }}
/current_user  | GET | this return the current user |  N/A
/jogging_times  | POST | This creates a jogging time for the current_user. NOTE:the user token must be included. NOTE: the admin user create it for other users but has his own routes | {  "jogging_time": {      "date": "2023-05-10",      "distance": "5. miles",      "time": "2023-05-10T07:30:00Z"    }}
/jogging_times  | GET | gets a list of all jogging times of the current user. NOTE:the user token must be included. NOTE: the admin user create it for other users but has his own routes | {"company": {"email": "company@gmail.com","password": "123456789"}}
/jogging_times/4  | PUT | This updates the jogging time  the id is the jogging time id |  {"jogging_time": {      "date": "2023-05-10",      "distance": 8.5 miles",      "time": "2023-05-10T07:30:00Z"    }}


 Now there is user and jogging time. Lets do something about that

# admin


Endpoint  | Method | Description | ex
------------- | ------------- | ------------- | -------------
/signup  | POST | This creates a special user with admin. Thins returns the token. By using this token we can a lot of things | {  "user": {"email": "admin@example.com", "password": "12345678",  "role": admin"  }
/jogging_times/add-jogging-times-to-user  | POST | By using an admin user token we can add the jogging times of a user. In this example we added a record to this user. | {"jogging_time": {      "date": "2023-05-10",      "distance": "c miles",      "time": "2023-05-10T07:30:00Z",      "user_id": 2    }}
/jogging_times/update-jogging-times-to-user/4 | PUT | This update the jogging time of a certain user. It can also change the id of the user. The id is for the jogging time id |  {  "jogging_time": {      "date": 2023-05-10",      "distance": "50 miles",      "time": 2023-05-10T07:30:00Z",      "user_id": 1    }}
/jogging_times/show-jogging-times-to-user/1  | GET | This returns the jogging times of a certain user. |  N/A
/jogging_times/remove-jogging-times-to-user/1  | DELETE | this delete a jogging time for any user. The id is the jogging time id |  N/A

now let’s create a user manager

# user Manager

Endpoint  | Method | Description | ex
------------- | ------------- | ------------- | -------------
/signup  | POST | This returns the token of the user manager. |    "user": {   "email": "user_manger@example.com",   "password": "12345678",  "role": "user_manager" }}

The user manager CRUDs the users. NOT the users records. NOTE the admin can do the same. Create some users like we did in the first step so we can proceed. Add jogging times as well. With the power of the user manager token we can:


Endpoint  | Method | Description | ex
------------- | ------------- | ------------- | -------------
/users/update/5  | PUT | this revokes the token |  {  "user": {    "email": "usasder@example.com",    "password": "12345678",    "role": "user"  }}
/users/show/5  | GET | returns the a certain user. |  N/A
/users/destroy/5  | DELETE | deletes the user with the id of 5. |  N/A
/users/filter_jogging_times_by_dates  | GET | This Filter by dates from-to. NOTE: the ID is the user id | {    "id": 5,    "start_date": "2020-01-01",    end_date": "2023-12-30"  }
/users/weekly_report/6  | GET  | Report on average speed & distance per week for a user with the id 6 |  N/A


### Run tests

To run tests, run the following command:


run: Rspec

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Author <a name="authors">MOHAMED</a>

👤 **Mohamed Eldeeb**

- GitHub: [@Mohammed](https://github.com/eng-mohamed-eldeeb)
- Twitter: [@El_Deeb](https://twitter.com/eldeeb_3o)
- LinkedIn: [@Mohammed Eldeeb](https://www.linkedin.com/in/eng-mohamed-eldeeb/)

