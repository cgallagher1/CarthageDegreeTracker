#Major class that will have a many_to_many relationship with courses
class Major < Sequel::Model
	many_to_many :courses
end