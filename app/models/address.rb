class Address < ActiveRecord::Base
  belongs_to :person
  validates :city, :presence => true
  validates :zip, :presence => true
  validates :street, :presence => true
  validates :person_id, :presence => true
end

