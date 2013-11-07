class Address < ActiveRecord::Base
  belongs_to :person
  validates :city, :zip, :street, :person_id, :presence => true
  before_save :default_country_if_blank
  
  private
  def default_country_if_blank
    if self.country.blank?
      self.country  = "USA"
    end
  end
end

