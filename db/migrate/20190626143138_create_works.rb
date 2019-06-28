class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :title
      t.string :description
      t.date :deadline

      t.timestamps
    end
  end
end
