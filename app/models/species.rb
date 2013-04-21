class Species < ActiveRecord::Base
  validates_uniqueness_of :species_id
  validates_presence_of :species_code

  def common_name
    "world"
  end

end
