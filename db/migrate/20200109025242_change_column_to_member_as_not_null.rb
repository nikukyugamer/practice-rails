class ChangeColumnToMemberAsNotNull < ActiveRecord::Migration[6.0]
  def up
    change_column :members, :firstname, :string, null: false, default: 'UNKNOWN'
    change_column :members, :lastname, :string, null: false, default: 'UNKNOWN'
    change_column :members, :age, :integer, null: false, default: '-1'
    change_column :members, :born_at_pref, :string, null: false, default: 'UNKNOWN'
  end

  def down
    change_column :members, :firstname, :string
    change_column :members, :lastname, :string
    change_column :members, :age, :integer
    change_column :members, :born_at_pref, :string
  end
end
