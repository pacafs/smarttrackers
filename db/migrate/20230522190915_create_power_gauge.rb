class CreatePowerGauge < ActiveRecord::Migration[7.0]
  def change
    create_table :power_gauges do |t|
      t.string :name
      t.date   :start_date
      t.date   :end_date
      t.string :unit
      t.string :time_unit
      
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
