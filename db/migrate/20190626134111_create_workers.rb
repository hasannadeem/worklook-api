class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :company_name
      t.string :email

      t.timestamps
    end
  end
end
