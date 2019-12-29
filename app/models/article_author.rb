class ArticleAuthor < ApplicationRecord
  belongs_to :article
  belongs_to :author

  validates :article_id, uniqueness: { scope: [:author_id] }
end
