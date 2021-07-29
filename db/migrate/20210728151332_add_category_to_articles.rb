class AddCategoryToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :category, 'integer USING CAST(category AS integer)'
  end
end
