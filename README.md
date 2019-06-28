# README

# WorkLook-Api
WorkLook-API lets you create work order and workers. A work order is a job to be completed by one or more workers before its deadline. WorkLook-API provides the facility to assign workers on work orders and retrieve work orders assigned to any worker.

## Heroku WorkLook-API end-points
Request: Get all work orders of a particular worker in ascending order of deadline
Route: https://dry-basin-48875.herokuapp.com/api/v1/workers/:id/get_works
Method: GET

Request: Get all workers
Route: https://dry-basin-48875.herokuapp.com/api/v1/workers
Method: GET

Request: Create a worker
Route: https://dry-basin-48875.herokuapp.com/api/v1/workers
Method: POST

Request: Deleting a worker
Route: https://dry-basin-48875.herokuapp.com/api/v1/workers/:id
Method: DELETE

Request: For adding a worker in a particular work order
Route: https://dry-basin-48875.herokuapp.com/api/v1/works/:id/add_worker
Method: POST

Request: Get all work orders
Route: https://dry-basin-48875.herokuapp.com/api/v1/works
Method: GET

Request: Create a work order
Route: https://dry-basin-48875.herokuapp.com/api/v1/works
Method: POST

## System Requirements
* Ruby version  2.6.0
* Rails version  5.2.3
* PostgreSQL 9.5

## Getting Started
<!-- Assuming that Ruby on Rails, Ruby, PostgreSQL are already installed on a system -->
* Download and extract the zip file and go to the directory of project i.e `worklook-api`
    * cd `worklook-api`
* Run `bundle install` to install all dependencies
* Setup database
    *  Run `rake db:create`
    *  Run `rake db:migrate`
* Run server `rails s`
* Use `postman` to send requests and retrieve responses

## How to Run Test Suite
Test cases are written using `rspec`. All the test cases are tested locally.

Anyone who wants to run it locally can use following process:
1. To run all the test cases use this:
* `rspec`
