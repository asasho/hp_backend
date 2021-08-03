class Article < ApplicationRecord
    include Rails.application.routes.url_helpers
    default_scope -> { order(updated_at: :asc) }
   has_one_attached :thumbnail
   
   enum category: { プレスリリース: 0, メディア: 1, その他: 2 }
   
   validates :thumbnail,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" }
   
   
   def image_url
       thumbnail.attached? ? url_for(thumbnail) : nil
   end
end
