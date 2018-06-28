class User < ApplicationRecord

validates :first_name, :presence => true
validates :last_name, :presence => true
validates :activity_status, :presence => true
validates :seniority_status, :presence => true
validates :employment_status, :presence => true


VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

validates(
  :email,
  presence: true,
  uniqueness: true,
  format: VALID_EMAIL_REGEX
)



def full_name
  first_name + " " + last_name
end

end
