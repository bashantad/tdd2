class Address < ActiveRecord::Base
  belongs_to :person
  validates :city, :presence => true
  validates :zip, :presence => true
  validates :street, :presence => true
  validates :person_id, :presence => true
  before_save :default_country_if_blank
  
  private
  def default_country_if_blank
    if self.country.blank?
      self.country  = "USA"
    end
  end
end

