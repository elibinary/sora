class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.text :body
      t.integer :category

      t.timestamps null: false
    end

    add_index :articles, :category, unique: true
  end
end
