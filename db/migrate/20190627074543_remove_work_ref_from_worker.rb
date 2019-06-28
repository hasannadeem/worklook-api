class RemoveWorkRefFromWorker < ActiveRecord::Migration[5.2]
  def change
    remove_column :workers, :work_id
  end
end
