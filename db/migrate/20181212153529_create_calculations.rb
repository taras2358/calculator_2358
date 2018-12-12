# frozen_string_literal: true

class CreateCalculations < ActiveRecord::Migration[5.2]
  def change
    create_table :calculations do |t|
      t.integer :a
      t.integer :b
      t.string :operator
      t.decimal :result, precision: 15, scale: 10
      t.integer :count, default: 0

      t.timestamps
    end

    add_index :calculations, [:a, :b, :operator]
  end
end
