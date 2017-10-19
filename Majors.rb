class Major < Sequel::Model
	many_to_many :courses
end