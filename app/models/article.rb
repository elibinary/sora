class Article < ActiveRecord::Base
  # title, author, body, category
  validates :title, :body, :category, presence: true

  has_and_belongs_to_many :tags, join_table: "article_tags"

  enum category: [ :Applied_Science, :Basic_Sciences, :Literature, :Dimension ]

  def self.hash_category
    {
      :Applied_Science => "Applied_Science",
      :Basic_Sciences => "Basic_Sciences",
      :Literature => "Literature",
      :Dimension => "Dimension"
    }
  end
end
