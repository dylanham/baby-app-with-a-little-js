class CreateBabies < ActiveRecord::Migration
  def change
    create_table :babies do |t|
      t.string :name
      t.decimal :weight
      t.decimal :length

      t.timestamps null: false
    end
  end
end
