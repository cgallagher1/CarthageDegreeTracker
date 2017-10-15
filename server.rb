require 'sinatra'
require 'sequel'
require 'sinatra/json'

#configure the app
configure do
	#connect to the sqlite database
	DB = Sequel.connect('sqlite://User.db') 

	#create a visitors table (if it doesn't already exist)
	DB.create_table? :User do
		primary_key :id 
		String :name 
		String :email, :unique => true
		DateTime :sign_in_time 
	end

	#after the db has been created for sure, open up the Visitor model
	#ruby will make the correct associations from the database file
	require_relative 'Visitor'
end