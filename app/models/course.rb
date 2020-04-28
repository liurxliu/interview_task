class Course < ApplicationRecord
  validates_inclusion_of :expire_days, :in => 1..30
end
