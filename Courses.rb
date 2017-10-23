#Courses class that will have a many_to_many relationship with majors and users
class Course < Sequel::Model
    many_to_many :majors
    many_to_many :users 
end