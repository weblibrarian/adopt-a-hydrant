class Species < ActiveRecord::Base
  validates_uniqueness_of :species_id
  validates_presence_of :code
end
