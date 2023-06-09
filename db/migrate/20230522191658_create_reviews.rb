class CreateReviews < ActiveRecord::Migration[7.0]

  def change
    create_table :reviews do |t|
      t.string :status, default: "Pending"

      t.references :user, null: false, foreign_key: true
      t.references :measurement, null: false, foreign_key: true
      t.timestamps
    end
  end

end

