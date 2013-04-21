class Species < ActiveRecord::Base
  validates_uniqueness_of :species_id
  validates_presence_of :common_name, :invasiveness_rank, :scientific_name, :species_code

end
