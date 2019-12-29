class CreateArticleAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :article_authors do |t|
      t.references :article, foreign_key: true
      t.references :author, foreign_key: true

      t.timestamps
    end

    add_index :article_authors, %i[article_id author_id], unique: true
  end
end
