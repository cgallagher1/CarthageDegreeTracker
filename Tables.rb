require 'sequel'

#connect to the sqlite database
DB = Sequel.connect('sqlite://Models.db') 

def create_tables
    
	#creates a table of majors (if it doesn't already exist)
	DB.create_table? :majors do
	  primary_key :id 
	  String :name 
	end

    
	#create a courses table (with a foreign key to the major)
	DB.create_table? :courses do
	  primary_key :id 
	  String :courseTitle
	  Float :courseNumber 
	  foreign_key :majors_id, :majors
	end
    
	#join tables are always named with the names of the two joining tables
	#in alphabetic order
	if not DB.table_exists?(:majors_courses)
		#create a join table for the many to many relationship between
		#courses and majors. This will create majors_courses
		DB.create_join_table(:majors_id => :majors, :course_id => :courses)
	end
    
    #go look at the model definitions at the end of the file
end

def createMajors
#one way to create a model object
#mark = Student.new
#mark.name = "Mark"
#mark.gpa = 3.1
#mark.save
#puts mark.inspect

#create a Major and store it in the database
Accounting = Majors.create(:name => "Accounting")
ArtEducation = Majors.create(:name => "Art Education (K-12)")
ArtHistory = Majors.create(:name => "Art History")
Art = Majors.create(:name => "Art (Studio)")


#create a couple of computers
marks_computer = Computer.create(:os => "W8.1", :cpu_speed => 2.7)
marks_phone = Computer.create(:os => "Android", :cpu_speed => 2.0)
#associate the student and the computers. Making the association in the
#model classed above created a set of methods to link objects together
mark.add_computer(marks_computer)
mark.add_computer(marks_phone)

#create another student and computer
laura = Student.create(:name => "Laura", :gpa => 3.8)
lauras_computer = Computer.create(:os => "OSX", :cpu_speed => 2.3)
#link the student and the computer
laura.add_computer(lauras_computer)

#create some students without a computer
buddy = Student.create(:name => "Buddy", :gpa => 3.9)
patrick = Student.create(:name => "Patrick", :gpa => 3.91)

#create some courses
cs1110 = Course.create(:course_name => 'CSC1110', :prof_name => 'Mahoney')
cs1120 = Course.create(:course_name => 'CSC1120', :prof_name => 'Mahoney')
cs3210 = Course.create(:course_name => 'CSC3210', :prof_name => 'Mahoney')

#use the association methods to link students to courses
cs1110.add_student(mark)
cs1110.add_student(laura)
cs1110.add_student(buddy)
cs1110.add_student(patrick)

cs1120.add_student(mark)
cs1120.add_student(patrick)

cs3210.add_student(laura)
cs3210.add_student(buddy)
cs3210.add_student(patrick)
	
	puts
end