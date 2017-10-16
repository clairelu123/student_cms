class Enroll < ActiveRecord::Base
  validates :grade, numericality: { only_integer: true }, :inclusion => {:in => [1,100]}
  belongs_to :student, inverse_of: :enrolls
  belongs_to :course, inverse_of: :enrolls
end
