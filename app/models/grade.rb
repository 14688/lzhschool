class Grade < ApplicationRecord
  #他的父类是school
  belongs_to :school
  #他的字类是classschool
  has_many :classschools
end
