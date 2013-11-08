require 'spec_helper'

describe Address do
  before(:each) do
    @attributes = {
      :street => "7 Tarakan St",
      :city => "Heidelberg West",
      :zip => "3081",
      :person_id => 1
    }
  end
  
  it 'should create a new instance given valid attributes' do
    Address.create!(@attributes)
  end
  
  context 'Validations' do
    [:street, :city, :zip, :person_id].each do |attr|
      it { should validate_presence_of(attr)}
    end
    
    it { should belong_to(:person)}
  end
   
  describe 'when country is missing' do
    it 'defaults to USA' do
      a = Address.new(@attributes)
      a.country.should be_blank
      a.save 
      a.country.should == "USA"
    end
  end
end
