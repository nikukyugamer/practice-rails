class CreatePunditers < ActiveRecord::Migration[6.0]
  def change
    create_table :punditers do |t|
      t.string :name
      t.string :place
      t.integer :price

      t.timestamps
    end
  end
end
