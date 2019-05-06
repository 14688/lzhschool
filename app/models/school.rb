class School < ApplicationRecord
  
  has_many :votes
  has_many :grades

  def login=(login)
    @login=login
  end
  
  def login
    @login || self.sname || self.sphone
  end
end
