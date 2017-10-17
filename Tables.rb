require 'sequel'


#connect to the sqlite database
DB = Sequel.connect('sqlite://Degree.db') 

def create_tables
    
	#create a table of Major (if it doesn't already exist)
	DB.create_table? :majors do
	  primary_key :id 
	  String :name 
	end

    
	#create a courses table (with a foreign key to the major)
	DB.create_table? :courses do
	  primary_key :id 
	  String :courseTitle
	  String :courseNumber 
	end
    
	#join tables are always named with the names of the two joining tables
	#in alphabetic order
	if not DB.table_exists?(:courses_majors)
		#create a join table for the many to many relationship between
		#courses and Major. This will create Major_courses
		DB.create_join_table(:major_id => :majors,:course_id => :courses)
	end
end

def createMajor

	#creates a Major object
	accounting = Major.create(:name => "Accounting")
	artEducation = Major.create(:name => "Art Education (K-12)")
	artHistory = Major.create(:name => "Art History")
	art = Major.create(:name => "Art (Studio)")
	asianStudies = Major.create(:name => "Asian Studies")
	athleticTraining = Major.create(:name => "Athletic Training")
	biology = Major.create(:name => "Biology")
	chemistry = Major.create(:name => "Chemistry")
	chinese = Major.create(:name => "Chinese")
	classicalArchaeology = Major.create(:name => "Classical Archaeology")
	classicalFoundations = Major.create(:name => "Classical Foundations")
	communication = Major.create(:name => "Communication")
	computerScience = Major.create(:name => "Computer Science")
	criminalJustice = Major.create(:name => "Criminal Justice")
	economics = Major.create(:name => "Economics")
	educationSpecial = Major.create(:name => "Education, Cross Categorical Special Education (K-12)")
	educationElementary = Major.create(:name => "Education, Elementary/Middle (1-8)")
	english = Major.create(:name => "English")
	creativeWriting = Major.create(:name => "English with emphasis in Creative Writing")
	environmentalScience = Major.create(:name => "Environmental Science")
	finance = Major.create(:name => "Finance")
	french = Major.create(:name => "French")
	gIS = Major.create(:name => "Geographic Information Science")
	geoscience = Major.create(:name => "Geoscience")
	german = Major.create(:name => "German")
	graphicDesign = Major.create(:name => "Graphic Design")
	greatIdeas = Major.create(:name => "Great Ideas")
	history = Major.create(:name => "History")
	iPE = Major.create(:name => "International Political Economy")
	japanese = Major.create(:name => "Japanese")
	management = Major.create(:name => "Management")
	marketing = Major.create(:name => "Marketing")
	mathematics = Major.create(:name => "Mathematics")
	music = Major.create(:name => "Music")
	musicEducation = Major.create(:name => "Music Education")
	neuroscience = Major.create(:name => "Neuroscience")
	nursing = Major.create(:name => "Nursing")
	philosophy = Major.create(:name => "Philosophy")
	pE = Major.create(:name => "Physical Education, Sport, and Fitness Instruction")
	physics = Major.create(:name => "Physics")
	politicalScience = Major.create(:name => "Political Science")
	psychology = Major.create(:name => "Psychology")
	publicRelations = Major.create(:name => "Public Relations")
	religion = Major.create(:name => "Religion")
	socialWork = Major.create(:name => "Social Work")
	sociology = Major.create(:name => "Sociology")
	spanish = Major.create(:name => "Spanish")
	theatre = Major.create(:name => "Theatre")
	theatrePerformance = Major.create(:name => "Theatre Performance")

	#Computer Science Classes
	#csc 1110 Principles of Computer Science I (4 credits)
	csc1110 = Course.create(:courseTitle => "Principles of Computer Science I ", :courseNumber => "csc 1110")
	#csc 1120 Principles of Computer Science II (4 credits)
	csc1120 = Course.create(:courseTitle => "Principles of Computer Science II ", :courseNumber => "csc 1120")
	#csc 2510 Computer Organization (4 credits)
	csc2510 = Course.create(:courseTitle => "Computer Organization", :courseNumber => "csc 2510")
	#csc 2560 Data Structures and Algorithms (4 credits)
	csc2560 = Course.create(:courseTitle => "Data Structures and Algorithms", :courseNumber => "csc 2560")
	#csc 3050 Object-Oriented Programming (4 credits)
	csc3050 = Course.create(:courseTitle => "Object-Oriented Programming", :courseNumber => "csc 3050")
	#csc 3210 Computing Paradigms (4 credits)
	csc3210 = Course.create(:courseTitle => "Computing Paradigms", :courseNumber => "csc 3210")
	#csc 3410 Database Design and Management (4 credits)
	csc3410 = Course.create(:courseTitle => "Database Design and Management", :courseNumber => "csc 3410")
	#csc 3450 Computer System Administration (4 credits)
	csc3450 = Course.create(:courseTitle => "Computer System Administration", :courseNumber => "csc 3450")
	#csc 3530 Artificial Intelligence and Cognitive Modeling (4 credits)
	csc3530 = Course.create(:courseTitle => "Artificial Intelligence and Cognitive Modeling", :courseNumber => "csc 3530")
	#csc 3600 Data Communications (4 credits)
	csc3600 = Course.create(:courseTitle => "Data Communications", :courseNumber => "csc 3600")
	#csc 3730 Operating Systems (4 credits)
	csc3730 = Course.create(:courseTitle => "Operating Systems", :courseNumber => "csc 3730")
	#csc 3750 Algorithms (4 credits)
	csc3750 = Course.create(:courseTitle => "Algorithms", :courseNumber => "csc 3750")
	#csc 400T Topics in Computer Science (1-4 credits)
	csc400T = Course.create(:courseTitle => "Topics in Computer Science", :courseNumber => "csc 400T")
	#csc 4350 Software Design and Development (4 credits)
	csc4350 = Course.create(:courseTitle => "Software Design and Development", :courseNumber => "csc 4350")
	#csc 4500 Independent Study (2-4 credits)
	csc4500 = Course.create(:courseTitle => "Independent Study", :courseNumber => "csc 4500")
	#csc 4650 Computer Architecture (4 credits)
	csc4650 = Course.create(:courseTitle => "Computer Architecture", :courseNumber => "csc 4650")
	#csc 4810 Foundations of Computer Science (4 credits)
	csc4810 = Course.create(:courseTitle => "Foundations of Computer Science", :courseNumber => "csc 4810")
	#csc 4900 Research in Computer Science (1-4 credits)
	csc4900 = Course.create(:courseTitle => "Research in Computer Science", :courseNumber => "csc 4900")
	#csc 4000 Senior Seminar (4 credits)
	csc4000 = Course.create(:courseTitle => "Senior Seminar", :courseNumber => "csc 4000")
	
	#Math Classes
		
	#MTH 1240 Discrete Structures (4 credits)
	mth1240 = Course.create(:courseTitle => "Discrete Structures", :courseNumber => "MTH 1240")

	#Creation of Major with Classes

	#Computer Science Major Complete
	computerScience.add_course(csc1110)
	computerScience.add_course(csc1120)
	computerScience.add_course(csc2510)
	computerScience.add_course(csc2560)
	computerScience.add_course(csc3050)
	computerScience.add_course(csc3210)
	computerScience.add_course(csc3410)
	computerScience.add_course(csc3450)
	computerScience.add_course(csc3530)
	computerScience.add_course(csc3600)
	computerScience.add_course(csc3730)
	computerScience.add_course(csc3750)
	computerScience.add_course(csc400T)
	computerScience.add_course(csc4350)                                                                                 
	computerScience.add_course(csc4500)
	computerScience.add_course(csc4650)
	computerScience.add_course(csc4810)
	computerScience.add_course(csc4900)
	computerScience.add_course(csc4000)
	
end


create_tables

require_relative 'Courses.rb'
require_relative 'Majors.rb'

createMajor


