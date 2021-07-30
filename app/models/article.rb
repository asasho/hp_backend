class Article < ApplicationRecord
    include Rails.application.routes.url_helpers
    
   has_one_attached :thumbnail
   
   enum category: { プレスリリース: 0, メディア: 1, その他: 2 }
   
   
   def image_url
       thumbnail.attached? ? url_for(thumbnail) : nil
   end
end
