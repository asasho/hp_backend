class ChangeDatatypeCategoryOfArticles < ActiveRecord::Migration[6.0]
  def change
    change_column :articles, :category, :integer
  end
end
