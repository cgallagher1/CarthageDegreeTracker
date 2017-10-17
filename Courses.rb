class Course < Sequel::Model
    #create some associations 
    #for the many to many relationship between courses and majors. Many to
	#many's require a join table to link the two together
	many_to_many :majors 
end