class Message < ActiveRecord::Base
  validates :sender, :recipient, :body, :presence => true
  belongs_to :sender, :class_name => "Person"
  belongs_to :recipient, :class_name => "Person"
end
