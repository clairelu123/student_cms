class Course < ActiveRecord::Base
  validates :name, presence, length: {maximum: 50}
  has_many :enrolls, :dependent => :destroy
  has_many :students, :through => :enrolls
  def display_name
    "#{name}"
  end
end
