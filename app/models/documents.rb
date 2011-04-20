class Documents < ActiveRecord::Base
  has_many :items
  has_one :agent  
end
