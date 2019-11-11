class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :work, foreign_key: true
      t.references :worker, foreign_key: true

      t.timestamps
    end
  end
end
