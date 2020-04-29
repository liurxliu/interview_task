class Course < ApplicationRecord
  validates_inclusion_of :expire_days, :in => 1..30
  belongs_to :user

  def expired?
    start_at + expire_days.days > Time.now
  end
end
