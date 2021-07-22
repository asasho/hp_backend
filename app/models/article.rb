class Article < ApplicationRecord
   has_attached_file :thumbnail, :styles => {
       :medium => "300x300>", :thumb => "100x100"
   }
   
   has_many_attached :images
end
