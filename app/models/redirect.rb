class Redirect < ActiveRecord::Base
  belongs_to :message
  belongs_to :agent
  
   
  validates_presence_of :agent_id
  validates_presence_of :message_id

end
