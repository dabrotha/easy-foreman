class Company < ApplicationRecord
  has_many :users
  validates :title, :presence => true
  validates :description, :presence => true

end
