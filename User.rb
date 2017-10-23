#User class that will have a many_to_many relationship with courses
class User < Sequel::Model
	many_to_many :courses
end