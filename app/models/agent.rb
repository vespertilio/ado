class Agent < ActiveRecord::Base
  has_many :messages
  belongs_to :org
  has_many :redirects
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  def sname
    if self.name
    name.gsub!('.',' ')
    names = self.name.split(/\ /)
    res = names[0] + " "
    res += names[1][0..1]+ "." if names[1]
    res += names[2][0..1]+ "." if names[2]
    return res
    else
      return "Без автора"
    end
  end
end
