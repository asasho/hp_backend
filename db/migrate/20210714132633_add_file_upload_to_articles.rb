class AddFileUploadToArticles < ActiveRecord::Migration[6.0]
  def change
    add_attachment :articles, :file_upload, :image
  end
end
