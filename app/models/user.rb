class User < ApplicationRecord

  has_secure_password()

  belongs_to :company, optional: true

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :activity_status, :presence => true, numericality: {more_or_equal_than: 0, less_or_equal_than: 2, only_integer: true }
  validates :seniority_status, :presence => true, numericality: {more_or_equal_than: 0, less_or_equal_than: 3, only_integer: true }
  validates :employment_status, :presence => true, numericality: {more_or_equal_than: 0, less_or_equal_than: 2, only_integer: true }


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates(
    :email,
    presence: true,
    format: VALID_EMAIL_REGEX
  )

  def full_name
    first_name + " " + last_name
  end

end
