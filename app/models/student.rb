class Student < ActiveRecord::Base

  validates :snum, numericality: { only_integer: true }
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

  has_many :enrolls, :dependent => :destroy
  has_many :courses, :through => :enrolls
  def display_name
    "#{name}"
  end

end
