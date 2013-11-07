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
      it "must have a #{attr}" do
        a = Address.create
        a.should_not be_valid
        a.errors.messages[attr].should_not be_nil
      end  
    end
  end
end
