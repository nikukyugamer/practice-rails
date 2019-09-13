class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :firstname
      t.string :lastname
      t.integer :age
      t.integer :sex # enum
      t.string :born_at_pref
      t.boolean :is_japanese

      t.timestamps
    end
  end
end
