class Article < ActiveRecord::Base
  # title, author, body, category
  validates :title, :body, :category, presence: true
end
