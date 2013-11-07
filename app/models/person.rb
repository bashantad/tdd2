class Person < ActiveRecord::Base
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  def joe?
    first_name == "Joe"
  end
  
  def self.search_by_name(term)
    Person.all(:conditions => ["first_name LIKE :term OR last_name LIKE :term", {:term => '%' + term + '%'}])
  end
end
