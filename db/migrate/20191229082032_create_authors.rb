class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :first_name, null: false, default: 'UNKNOWN'
      t.string :last_name, null: false, default: 'UNKNOWN'
      t.string :job, null: false, default: 'UNKNOWN'
      t.string :country, null: false, default: 'UNKNOWN'

      t.timestamps
    end
  end
end
