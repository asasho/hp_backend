class CreateArticleImages < ActiveRecord::Migration[6.0]
  def change
    create_table :article_images do |t|
      

      t.timestamps
    end
  end
end
