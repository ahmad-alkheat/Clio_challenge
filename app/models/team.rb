class Team < ActiveRecord::Base
  has_many :users
  attr_accessible :title
  validates_presence_of :title
end
