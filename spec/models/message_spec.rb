require 'spec_helper'

describe Message do
  describe "validations" do
    %w(sender, recipient, body).each do |attr|
      it "must have #{attr}" do
        m = Message.create
        m.should_not be_valid
      end
    end    
  end
  describe "Association" do 
    it 'belongs to a sender' do
      Message.new.should respond_to(:sender)
    end
    
    it 'belongs to recipient' do
      Message.new.should respond_to(:recipient)
    end
    
    it 'can retrieve a sender and that is a Person object' do
      msg = FactoryGirl.create(:message)
      msg.sender.should_not be_nil
      msg.sender.should be_kind_of(Person)
    end
  end
end
