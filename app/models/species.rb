class Species < ActiveRecord::Base
  attr_accessible :code, :common_name, :invasiveness_rank, :notes, :scientific_name

  has_many :species

end
