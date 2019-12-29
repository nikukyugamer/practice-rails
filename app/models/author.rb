class Author < ApplicationRecord
  has_many :article_authors
  has_many :articles, through: :article_authors

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :job, presence: true
  validates :country, presence: true
end
