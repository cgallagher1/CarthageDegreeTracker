class Major < Sequel::Model

    #create some associations 
    #for the many to many relationship between courses and majors. Many to
	#many's require a join table to link the two together
	many_to_many :courses
    
    #now the class has methods to 'reach into' the associated classes
end