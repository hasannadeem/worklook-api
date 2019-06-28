class Work < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :workers, through: :assignments

  validates_presence_of :title, :description, :deadline

  before_create :validate_deadline

  private
  def validate_deadline
    if self.deadline < Date.today
      self.errors.add(:base, 'Deadline has been passed!')
      raise ActiveRecord::RecordInvalid.new(self)
    end
  end
end
