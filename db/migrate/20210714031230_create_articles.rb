class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :category

      t.timestamps
    end
  end
end
