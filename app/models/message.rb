class Message < ActiveRecord::Base
  belongs_to :agent
  has_many :cards
  attr_accessor :upload
  belongs_to :org
  has_many :redirects
  
  validates_presence_of :subject
  
  
  def agent_name
    self.agent.name if self.agent
  end
    
  def agent_name=(name)
    self.agent = Agent.find_or_create_by_name(name) unless name.blank?
  end
  
  def agent_position=(name)
    unless name.blank?
      if self.agent_name      
        self.agent.position = name
        self.agent.save
      end
    end
  end
  
  def agent_position
    self.agent.position if self.agent
  end
  
  def agent_org=(name)
    unless name.blank?
      self.org = Org.find_or_create_by_name(name) 
    end    
  end
  
  def agent_redirect=(name)
   self.redirect.agent.name = Agent.find_or_create_ny_name(name) unless name.blank?    
  end
  
  def agent_org
    if self.agent
      if self.agent.org
        self.agent.org.name
      end
    end
  end 
     
end
