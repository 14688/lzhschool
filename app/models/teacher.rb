class Teacher < ApplicationRecord
  belongs_to :classschool
  has_many :student
end
