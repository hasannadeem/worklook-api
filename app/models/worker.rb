class Worker < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :works, through: :assignments

  validates_presence_of :name
  validates :email, uniqueness: true, presence: true
end
