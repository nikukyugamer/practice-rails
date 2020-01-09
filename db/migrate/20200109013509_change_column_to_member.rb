class ChangeColumnToMember < ActiveRecord::Migration[6.0]
  def up
    change_column :members, :sex, :integer, null: false, default: 0
    change_column :members, :is_japanese, :boolean, null: false, default: true
  end

  def down
    change_column :members, :sex, :integer, null: true
    change_column :members, :is_japanese, :boolean, null: true
  end
end
