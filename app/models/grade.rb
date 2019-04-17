class Grade < ApplicationRecord
  belongs_to :school#上面是school
  has_many :classschool#下面classschool
end
