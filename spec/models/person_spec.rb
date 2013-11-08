require 'spec_helper'

describe Person do
  before(:each) do 
    @valid_attributes = {
      :first_name => "Joe",
      :last_name => "Brown"
    }
  end
  
  it 'must have a first name' do 
    lambda{
      Person.create(:first_name=>'', :last_name => 'Doe')
    }.should_not change(Person, :count)
  end
  
  it 'must have first_name' do
    p = Person.create
    p.errors.messages[:first_name].should_not be_nil
  end
  
  it 'must have last_name' do
    p = Person.create
    p.errors.messages[:last_name].should_not be_nil
  end
  
  it 'should create a new instance given valid attributes' do
    lambda { 
        Person.create(@valid_attributes)      
    }.should change {Person.count}.by(1)
  end
  
  it 'should save the first name' do
    p = Person.create(:first_name=> "Bashanta")
    p.first_name.should eql("Bashanta")
  end
  
  it 'leaves last_name nil if not assigned' do
    p = Person.create
    p.last_name.should be_nil
  end
  
  it 'first name should be joe' do
    p = Person.create(:first_name => "Joe")
    p.should be_joe
  end
  
  it 'can make a person from factory' do
    p = FactoryGirl.create(:person)
    p.should_not be_nil
    p.should be_kind_of(Person)
  end
  
  it 'should find people by partial name match' do
    john = FactoryGirl.create(:person, :first_name => "Jona", :last_name => "Doe")
    peter = FactoryGirl.create(:person, :first_name => "Peter", :last_name => "Jones")
    sally = FactoryGirl.create(:person, :first_name => "Sally", :last_name => "Parker")
    Person.all.should == [john, peter, sally]
    Person.search_by_name("Jon").should == [john, peter]
  end
  
  it { should have_many(:messages)}
end