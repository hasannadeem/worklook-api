class AddWorkRefToWorkers < ActiveRecord::Migration[5.2]
  def change
    add_reference :workers, :work, foreign_key: true
  end
end
