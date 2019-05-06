class Teacher < ApplicationRecord
  belongs_to :classschool
  has_many :students
end
