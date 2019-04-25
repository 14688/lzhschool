class School < ApplicationRecord
  
  has_many :votes
  has_many :grade
  def login=(login)
    @login=login
  end
  def login
    @login || self.sname || self.sphone
  end
end
