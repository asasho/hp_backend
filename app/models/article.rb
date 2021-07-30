class Article < ApplicationRecord
    include Rails.application.routes.url_helpers
    
   has_one_attached :thumbnail
   
   
   def image_url
       thumbnail.attached? ? url_for(thumbnail) : nil
   end
end
