class CreateCalculations < ActiveRecord::Migration[5.2]
  def change
    create_table :calculations do |t|
      t.integer :a
      t.integer :b
      t.string :operation
      t.decimal :result, precision: 15, scale: 10

      t.timestamps
    end
  end
end
