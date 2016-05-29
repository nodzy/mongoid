class Racer
  include Mongoid::Document
  field :first_name, as: :fn, type: String
  field :last_name, as: :ln, type: String
  field :date_of_birth, as: :dob, type: Date
  
  embeds_one :primary_address, class_name: 'Address', as: :addressable
  has_one :medical_record, dependent: :destroy
  validates :first_name, :last_name, presence: true
  
    
	def races
    Contest.where(:"entrants.racer_id"=>self.id).map do |contest| 
      contest.entrants.where(:racer_id=>self.id)
    end
  end
	
	

end
