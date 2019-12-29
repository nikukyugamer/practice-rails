class Article < ApplicationRecord
  has_many :article_authors
  has_many :authors, through: :article_authors

  validates :title, presence: true
  validates :genre, presence: true
  validates :published_at, presence: true
end
