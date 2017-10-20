require 'sinatra'
require 'sequel'
require 'sinatra'
require 'json'

#enable sessions in the server (this is not on by default)
enable :sessions
all_majors = Array.new
#connect to the sqlite database
configure do
    #connect to the sqlite database
    DB = Sequel.connect('sqlite://Degree.db') 

    def create_tables
        
        #create a table of Major (if it doesn't already exist)
        DB.create_table? :majors do
        primary_key :id 
        String :name 
        end

        
        #create a Courses table (with a foreign key to the major)
        DB.create_table? :courses do
        primary_key :id 
        String :courseTitle
        String :courseNumber 
        end

        DB.create_table? :users do
        primary_key :id 
        String :userName
        end

        #join tables are always named with the names of the two joining tables
        #in alphabetic order
        if not DB.table_exists?(:courses_majors)
            #create a join table for the many to many relationship between
            #Courses and Majors. This will create courses_majors
            DB.create_join_table(:course_id => :courses,:major_id => :majors)
        end

        if not DB.table_exists?(:courses_users)
            DB.create_join_table(:course_id => :courses, :user_id => :users)
        end

    end

    def createMajor
        #creates a User
        theUser = User.create(:userName => "user")

        #creates a Major object and adds them to the list of majors
        accounting = Major.create(:name => "accounting")
        artEducation = Major.create(:name => "artEducation")
        artHistory = Major.create(:name => "artHistory")
        art = Major.create(:name => "artStudio")
        asianStudies = Major.create(:name => "asianStudies")
        athleticTraining = Major.create(:name => "athleticTraining")
        biology = Major.create(:name => "biology")
        chemistry = Major.create(:name => "chemistry")
        chinese = Major.create(:name => "chinese")
        classicalArchaeology = Major.create(:name => "classicalArchaeology")
        classicalFoundations = Major.create(:name => "classicalFoundations")
        communication = Major.create(:name => "communication")
        computerScience = Major.create(:name => "computerScience")
        criminalJustice = Major.create(:name => "criminalJustice")
        economics = Major.create(:name => "economics")
        educationSpecial = Major.create(:name => "education")
        english = Major.create(:name => "english")
        environmentalScience = Major.create(:name => "environmentalScience")
        finance = Major.create(:name => "finance")
        french = Major.create(:name => "french")
        gIS = Major.create(:name => "gIS")
        geoscience = Major.create(:name => "geoscience")
        german = Major.create(:name => "german")
        graphicDesign = Major.create(:name => "graphicDesign")
        greatIdeas = Major.create(:name => "greatIdeas")
        history = Major.create(:name => "history")
        iPE = Major.create(:name => "iPE")
        japanese = Major.create(:name => "japanese")
        management = Major.create(:name => "management")
        marketing = Major.create(:name => "marketing")
        mathematics = Major.create(:name => "mathematics")
        music = Major.create(:name => "music")
        musicEducation = Major.create(:name => "musicEducation")
        neuroscience = Major.create(:name => "neuroscience")
        nursing = Major.create(:name => "nursing")
        philosophy = Major.create(:name => "philosophy")
        pe = Major.create(:name => "pe")
        physics = Major.create(:name => "physics")
        politicalScience = Major.create(:name => "politicalScience")
        psychology = Major.create(:name => "psychology")
        publicRelations = Major.create(:name => "publicRelations")
        religion = Major.create(:name => "religion")
        socialWork = Major.create(:name => "socialWork")
        sociology = Major.create(:name => "sociology")
        spanish = Major.create(:name => "spanish")
        theatre = Major.create(:name => "theatre")
        theatrePerformance = Major.create(:name => "theatrePerformance")

        #Computer Science Classes
        #csc 1110 Principles of Computer Science I (4 credits)
        csc1110 = Course.create(:courseTitle => "Principles of Computer Science I ", :courseNumber => "csc1110")
        #csc 1120 Principles of Computer Science II (4 credits)
        csc1120 = Course.create(:courseTitle => "Principles of Computer Science II ", :courseNumber => "csc1120")
        #csc 2510 Computer Organization (4 credits)
        csc2510 = Course.create(:courseTitle => "Computer Organization", :courseNumber => "csc2510")
        #csc 2560 Data Structures and Algorithms (4 credits)
        csc2560 = Course.create(:courseTitle => "Data Structures and Algorithms", :courseNumber => "csc2560")
        #csc 3050 Object-Oriented Programming (4 credits)
        csc3050 = Course.create(:courseTitle => "Object-Oriented Programming", :courseNumber => "csc3050")
        #csc 3210 Computing Paradigms (4 credits)
        csc3210 = Course.create(:courseTitle => "Computing Paradigms", :courseNumber => "csc3210")
        #csc 3410 Database Design and Management (4 credits)
        csc3410 = Course.create(:courseTitle => "Database Design and Management", :courseNumber => "csc3410")
        #csc 3450 Computer System Administration (4 credits)
        csc3450 = Course.create(:courseTitle => "Computer System Administration", :courseNumber => "csc3450")
        #csc 3530 Artificial Intelligence and Cognitive Modeling (4 credits)
        csc3530 = Course.create(:courseTitle => "Artificial Intelligence and Cognitive Modeling", :courseNumber => "csc3530")
        #csc 3600 Data Communications (4 credits)
        csc3600 = Course.create(:courseTitle => "Data Communications", :courseNumber => "csc3600")
        #csc 3730 Operating Systems (4 credits)
        csc3730 = Course.create(:courseTitle => "Operating Systems", :courseNumber => "csc3730")
        #csc 3750 Algorithms (4 credits)
        csc3750 = Course.create(:courseTitle => "Algorithms", :courseNumber => "csc 3750")
        #csc 400T Topics in Computer Science (1-4 credits)
        csc400T = Course.create(:courseTitle => "Topics in Computer Science", :courseNumber => "csc400T")
        #csc 4350 Software Design and Development (4 credits)
        csc4350 = Course.create(:courseTitle => "Software Design and Development", :courseNumber => "csc4350")
        #csc 4500 Independent Study (2-4 credits)
        csc4500 = Course.create(:courseTitle => "Independent Study", :courseNumber => "csc4500")
        #csc 4650 Computer Architecture (4 credits)
        csc4650 = Course.create(:courseTitle => "Computer Architecture", :courseNumber => "csc4650")
        #csc 4810 Foundations of Computer Science (4 credits)
        csc4810 = Course.create(:courseTitle => "Foundations of Computer Science", :courseNumber => "csc4810")
        #csc 4900 Research in Computer Science (1-4 credits)
        csc4900 = Course.create(:courseTitle => "Research in Computer Science", :courseNumber => "csc4900")
        #csc 4000 Senior Seminar (4 credits)
        csc4000 = Course.create(:courseTitle => "Senior Seminar", :courseNumber => "csc4000")
        
        #Math Classes
            
        #MTH 1240 Discrete Structures (4 credits)
        mth1240 = Course.create(:courseTitle => "Discrete Structures", :courseNumber => "mth1240")

        #Creation of Major with Classes

        #Computer Science Major Classes
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

        #Math Major Classes
        mathematics.add_course(mth1240)
        
    end
 
end

create_tables
require_relative 'Courses.rb'
require_relative 'Majors.rb'
require_relative 'User.rb'
createMajor

#handles the inital page loads
get '/' do
    @all_majors = Major.order(:name)
    
	#render the template in the views folder guestbook.erb
	erb :graduationTracker
end

post '/major' do 
	#params holds the data from the post request
    majorSelected = Major.where(:name => params[:name])
    
    all_courses = Array.new

    majorSelected.each do |major|
        all_courses = major.courses.each.map do |currentCourse|
            course_info = {:courseTitle => currentCourse.courseTitle, :courseNumber => currentCourse.courseNumber}
        end
    end

    return JSON all_courses

end

post '/add' do
    getUser = User[:userName => "user"]
    
    courseSelected = Course.where(:courseNumber => params[:courseNumber])

    course_info = Array.new

    courseSelected.each do |course|
        getUser.add_course(course)
        course_info = [{:courseTitle => course.courseTitle, :courseNumber => course.courseNumber}]
    end

    return JSON course_info

end



