require 'sequel'
require_relative 'Courses.rb'
require_relative 'Majors.rb'

#connect to the sqlite database
DB = Sequel.connect('sqlite://Tables.db') 

def create_tables
    
	#create a table of majors (if it doesn't already exist)
	DB.create_table? :majors do
	  primary_key :id 
	  String :name 
	end

    
	#create a courses table (with a foreign key to the major)
	DB.create_table? :courses do
	  primary_key :id 
	  String :courseTitle
	  String :courseNumber 
	  foreign_key :majors_id, :majors
	end
    
	#join tables are always named with the names of the two joining tables
	#in alphabetic order
	if not DB.table_exists?(:courses_majors)
		#create a join table for the many to many relationship between
		#courses and majors. This will create majors_courses
		DB.create_join_table(:courses_id => :courses , :majors_id => :majors)
	end
end

def createMajors

	#creates a Major object
	accounting = Majors.create(:name => "Accounting")
	artEducation = Majors.create(:name => "Art Education (K-12)")
	artHistory = Majors.create(:name => "Art History")
	art = Majors.create(:name => "Art (Studio)")
	asianStudies = Majors.create(:name => "Asian Studies")
	athleticTraining = Majors.create(:name => "Athletic Training")
	biology = Majors.create(:name => "Biology")
	chemistry = Majors.create(:name => "Chemistry")
	chinese = Majors.create(:name => "Chinese")
	classicalArchaeology = Majors.create(:name => "Classical Archaeology")
	classicalFoundations = Majors.create(:name => "Classical Foundations")
	communication = Majors.create(:name => "Communication")
	computerScience = Majors.create(:name => "Computer Science")
	criminalJustice = Majors.create(:name => "Criminal Justice")
	economics = Majors.create(:name => "Economics")
	educationSpecial = Majors.create(:name => "Education, Cross Categorical Special Education (K-12)")
	educationElementary = Majors.create(:name => "Education, Elementary/Middle (1-8)")
	english = Majors.create(:name => "English")
	creativeWriting = Majors.create(:name => "English with emphasis in Creative Writing")
	environmentalScience = Majors.create(:name => "Environmental Science")
	finance = Majors.create(:name => "Finance")
	french = Majors.create(:name => "French")
	gIS = Majors.create(:name => "Geographic Information Science")
	geoscience = Majors.create(:name => "Geoscience")
	german = Majors.create(:name => "German")
	graphicDesign = Majors.create(:name => "Graphic Design")
	greatIdeas = Majors.create(:name => "Great Ideas")
	history = Majors.create(:name => "History")
	iPE = Majors.create(:name => "International Political Economy")
	japanese = Majors.create(:name => "Japanese")
	management = Majors.create(:name => "Management")
	marketing = Majors.create(:name => "Marketing")
	mathematics = Majors.create(:name => "Mathematics")
	music = Majors.create(:name => "Music")
	musicEducation = Majors.create(:name => "Music Education")
	neuroscience = Majors.create(:name => "Neuroscience")
	nursing = Majors.create(:name => "Nursing")
	philosophy = Majors.create(:name => "Philosophy")
	pE = Majors.create(:name => "Physical Education, Sport, and Fitness Instruction")
	physics = Majors.create(:name => "Physics")
	politicalScience = Majors.create(:name => "Political Science")
	psychology = Majors.create(:name => "Psychology")
	publicRelations = Majors.create(:name => "Public Relations")
	religion = Majors.create(:name => "Religion")
	socialWork = Majors.create(:name => "Social Work")
	sociology = Majors.create(:name => "Sociology")
	spanish = Majors.create(:name => "Spanish")
	theatre = Majors.create(:name => "Theatre")
	theatrePerformance = Majors.create(:name => "Theatre Performance")

	#Computer Science Classes
	#csc 1110 Principles of Computer Science I (4 credits)
	csc1110 = Courses.create(:courseTitle => "Principles of Computer Science I ", :courseNumber => "csc 1110")
	#csc 1120 Principles of Computer Science II (4 credits)
	csc1120 = Courses.create(:courseTitle => "Principles of Computer Science II ", :courseNumber => "csc 1120")
	#csc 2510 Computer Organization (4 credits)
	csc2510 = Courses.create(:courseTitle => "Computer Organization", :courseNumber => "csc 2510")
	#csc 2560 Data Structures and Algorithms (4 credits)
	csc2560 = Courses.create(:courseTitle => "Data Structures and Algorithms", :courseNumber => "csc 2560")
	#csc 3050 Object-Oriented Programming (4 credits)
	csc3050 = Courses.create(:courseTitle => "Object-Oriented Programming", :courseNumber => "csc 3050")
	#csc 3210 Computing Paradigms (4 credits)
	csc3210 = Courses.create(:courseTitle => "Computing Paradigms", :courseNumber => "csc 3210")
	#csc 3410 Database Design and Management (4 credits)
	csc3410 = Courses.create(:courseTitle => "Database Design and Management", :courseNumber => "csc 3410")
	#csc 3450 Computer System Administration (4 credits)
	csc3450 = Courses.create(:courseTitle => "Computer System Administration", :courseNumber => "csc 3450")
	#csc 3530 Artificial Intelligence and Cognitive Modeling (4 credits)
	csc3530 = Courses.create(:courseTitle => "Artificial Intelligence and Cognitive Modeling", :courseNumber => "csc 3530")
	#csc 3600 Data Communications (4 credits)
	csc3600 = Courses.create(:courseTitle => "Data Communications", :courseNumber => "csc 3600")
	#csc 3730 Operating Systems (4 credits)
	csc3730 = Courses.create(:courseTitle => "Operating Systems", :courseNumber => "csc 3730")
	#csc 3750 Algorithms (4 credits)
	csc3750 = Courses.create(:courseTitle => "Algorithms", :courseNumber => "csc 3750")
	#csc 400T Topics in Computer Science (1-4 credits)
	csc400T = Courses.create(:courseTitle => "Topics in Computer Science", :courseNumber => "csc 400T")
	#csc 4350 Software Design and Development (4 credits)
	csc4350 = Courses.create(:courseTitle => "Software Design and Development", :courseNumber => "csc 4350")
	#csc 4500 Independent Study (2-4 credits)
	csc4500 = Courses.create(:courseTitle => "Independent Study", :courseNumber => "csc 4500")
	#csc 4650 Computer Architecture (4 credits)
	csc4650 = Courses.create(:courseTitle => "Computer Architecture", :courseNumber => "csc 4650")
	#csc 4810 Foundations of Computer Science (4 credits)
	csc4810 = Courses.create(:courseTitle => "Foundations of Computer Science", :courseNumber => "csc 4810")
	#csc 4900 Research in Computer Science (1-4 credits)
	csc4900 = Courses.create(:courseTitle => "Research in Computer Science", :courseNumber => "csc 4900")
	#csc 4000 Senior Seminar (4 credits)
	csc4000 = Courses.create(:courseTitle => "Senior Seminar", :courseNumber => "csc 4000")
	
	#Math Classes
		
	#MTH 1240 Discrete Structures (4 credits)
	mth1240 = Courses.create(:courseTitle => "Discrete Structures", :courseNumber => "MTH 1240")

	#Creation of Majors with Classes

	#Computer Science Major Complete
	computerScience.add_courses(csc1110)
	computerScience.add_courses(csc1120)
	computerScience.add_courses(csc2510)
	computerScience.add_courses(csc2560)
	computerScience.add_courses(csc3050)
	computerScience.add_courses(csc3210)
	computerScience.add_courses(csc3410)
	computerScience.add_courses(csc3450)
	computerScience.add_courses(csc3530)
	computerScience.add_courses(csc3600)
	computerScience.add_courses(csc3730)
	computerScience.add_courses(csc3750)
	computerScience.add_courses(csc400T)
	computerScience.add_courses(csc4350)                                                                                 
	computerScience.add_courses(csc4500)
	computerScience.add_courses(csc4650)
	computerScience.add_courses(csc4810)
	computerScience.add_courses(csc4900)
	computerScience.add_courses(csc4000)
	
end

def print_Major_Courses(name)
    
    puts "-- Print Major by name and show their courses --"
    
    #find all the students with the passed in name
	Majors.where(:name => name).each do |class|
		#print the student
		puts "#{class.name}'s course is #{}"
	end
    
    puts
end

createMajors


