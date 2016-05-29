class Point


	attr_accessor :longitude, :latitude
	
	def initialize(longitude, latitude)
	
		@longitude = longitude
		@latitude = latitude
	
	end

	def mongoize
	
	    h = {:type=>"Point", :coordinates=>[@longitude, @latitude]}
	
	end


	def self.demongoize(hashh)
		
	    Point.new(hashh[:coordinates][0], hashh[:coordinates][1]) 
	end
	
	def self.mongoize(input)
	
	    input.instance_of?(Hash) ? input : {:type=>"Point", :coordinates=>[input.longitude, input.latitude]} 
	
	end
	
		def self.evolve(input)
	
	    input.instance_of?(Hash) ? input : {:type=>"Point", :coordinates=>[input.longitude, input.latitude]} 
	
	end
	
	
	
	
	end