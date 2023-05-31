class CreateMeasurements < ActiveRecord::Migration[7.0]
  def change
    create_table :measurements do |t|
      
      t.float   :amount
      t.boolean :approved
      
      t.references :power_gauge, null: false, foreign_key: true
      t.timestamps
    end
  end
end
