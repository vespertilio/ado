class Message < ActiveRecord::Base
  validates_presence_of :org_id
  belongs_to :org
end
