require 'sequel'

#connect to the sqlite database
DB = Sequel.connect('sqlite://Models.db') 

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
	if not DB.table_exists?(:majors_courses)
		#create a join table for the many to many relationship between
		#courses and majors. This will create majors_courses
		DB.create_join_table(:majors_id => :majors, :course_id => :courses)
	end
end

def createMajors
	majors = DB[:majors]
	#insert a Major and stores it in the database
	Accounting = majors.insert(:name => "Accounting")
	ArtEducation = majors.insert(:name => "Art Education (K-12)")
	ArtHistory = majors.insert(:name => "Art History")
	Art = majors.insert(:name => "Art (Studio)")
	AsianStudies = majors.insert(:name => "Asian Studies")
	AthleticTraining = majors.insert(:name => "Athletic Training")
	Biology = majors.insert(:name => "Biology")
	Chemistry = majors.insert(:name => "Chemistry")
	Chinese = majors.insert(:name => "Chinese")
	ClassicalArchaeology = majors.insert(:name => "Classical Archaeology")
	ClassicalFoundations = majors.insert(:name => "Classical Foundations")
	Communication = majors.insert(:name => "Communication")
	ComputerScience = majors.insert(:name => "Computer Science")
	CriminalJustice = majors.insert(:name => "Criminal Justice")
	Economics = majors.insert(:name => "Economics")
	EducationSpecial = majors.insert(:name => "Education, Cross Categorical Special Education (K-12)")
	EducationElementary = majors.insert(:name => "Education, Elementary/Middle (1-8)")
	English = majors.insert(:name => "English")
	CreativeWriting = majors.insert(:name => "English with emphasis in Creative Writing")
	EnvironmentalScience = majors.insert(:name => "Environmental Science")
	Finance = majors.insert(:name => "Finance")
	French = majors.insert(:name => "French")
	GIS = majors.insert(:name => "Geographic Information Science")
	Geoscience = majors.insert(:name => "Geoscience")
	German = majors.insert(:name => "German")
	GraphicDesign = majors.insert(:name => "Graphic Design")
	GreatIdeas = majors.insert(:name => "Great Ideas")
	History = majors.insert(:name => "History")
	IPE = majors.insert(:name => "International Political Economy")
	Japanese = majors.insert(:name => "Japanese")
	Management = majors.insert(:name => "Management")
	Marketing = majors.insert(:name => "Marketing")
	Mathematics = majors.insert(:name => "Mathematics")
	Music = majors.insert(:name => "Music")
	MusicEducation = majors.insert(:name => "Music Education")
	Neuroscience = majors.insert(:name => "Neuroscience")
	Nursing = majors.insert(:name => "Nursing")
	Philosophy = majors.insert(:name => "Philosophy")
	PE = majors.insert(:name => "Physical Education, Sport, and Fitness Instruction")
	Physics = majors.insert(:name => "Physics")
	PoliticalScience = majors.insert(:name => "Political Science")
	Psychology = majors.insert(:name => "Psychology")
	PublicRelations = majors.insert(:name => "Public Relations")
	Religion = majors.insert(:name => "Religion")
	SocialWork = majors.insert(:name => "Social Work")
	Sociology = majors.insert(:name => "Sociology")
	Spanish = majors.insert(:name => "Spanish")
	Theatre = majors.insert(:name => "Theatre")
	TheatrePerformance = majors.insert(:name => "Theatre Performance")
end

def createCourses
	#List of possible courses
	courses = DB[:courses]
	ACC2010 = courses.insert(:courseTitle => "Financial Accounting", :courseNumber => "ACC 2010")

end





