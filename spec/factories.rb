FactoryGirl.define do
  factory :person do |p|
    p.first_name "John"
    p.last_name "Doe"
  end
  factory :message do |m|
    m.association :sender, :factory => :person
    m.association :recipient, :factory => :person
    m.body "This is message"
  end
end