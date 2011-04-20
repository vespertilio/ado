class Org < ActiveRecord::Base
  has_one :commendant
  has_many :agents
  has_many :messages
end
