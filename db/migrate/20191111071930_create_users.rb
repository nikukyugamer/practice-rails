class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.float :height
      t.float :weight

      t.text :foobar_data
      t.timestamps
    end
  end
end
