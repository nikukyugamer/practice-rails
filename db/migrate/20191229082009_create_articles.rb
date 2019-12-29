class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :sub_title
      t.string :genre, null: false, default: 'UNKNOWN'
      t.datetime :published_at, null: false, default: '1970-01-01 12:00:00 JST'

      t.timestamps
    end
  end
end
