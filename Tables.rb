require 'sequel'

#connect to the sqlite database
DB = Sequel.connect('sqlite://Models.db') 

def create_tables
    
	#create a students table (if it doesn't already exist)
	DB.create_table? :students do
	  primary_key :id 
	  String :name 
	  Float :gpa 
	end

    
	#create a computers table (with a foreign key to the student)
	DB.create_table? :computers do
	  primary_key :id 
	  String :os 
	  Float :cpu_speed 
	  foreign_key :student_id, :students
	end

    
	#create a courses table (no foreign keys- we need a separate join table
	#for many to many relationships)
	DB.create_table? :courses do
	  primary_key :id 
	  String :course_name 
	  String :prof_name 
	end

    
	#join tables are always named with the names of the two joining tables
	#in alphabetic order
	if not DB.table_exists?(:courses_students)
		#create a join table for the many to many relationship between
		#courses and students. This will create courses_students
		DB.create_join_table(:student_id => :students, :course_id => :courses)
	end
    
    #go look at the model definitions at the end of the file
end