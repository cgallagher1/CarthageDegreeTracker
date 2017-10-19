class Course < Sequel::Model
    many_to_many :majors
    many_to_many :users 
end