class Course < ApplicationRecord
  validates_inclusion_of :end_at, :in => (Time.now + 1.day)..(Time.now + 30.days + 1.second)
end
