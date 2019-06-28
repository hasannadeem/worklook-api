class Assignment < ApplicationRecord
  NUMBER_OF_PERMITTED_WORKERS = 5

  belongs_to :work
  belongs_to :worker

  before_create :validate_worker_limit

  private
  def validate_worker_limit
    if self.work.workers.count >= NUMBER_OF_PERMITTED_WORKERS
      self.errors.add(:base, 'Cannot add more workers on this order work')
      raise ActiveRecord::RecordInvalid.new(self)
    end
  end
end
