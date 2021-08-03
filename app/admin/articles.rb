ActiveAdmin.register Article do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :thumbnail, :title, :description, :category
  
  filter :category, :as => :select, :collection => [["プレスリリース", 0], ["メディア", 1], ["その他", 2]]
    
  
  show do
    attributes_table do
      row "トップ画像", :thumbnail do |article|
        image_tag url_for(article.thumbnail)
      end
      row "タイトル", :title
      row "内容", :description
      row "カテゴリー", :category do |article|
        article.category
      end
      row "作成日", :created_at
      row "更新日", :updated_at
    end
  end
  
  index do
    selectable_column
    column "ID", :id
    column "トップ画像", :thumbnail do |article|
      image_tag url_for(article.thumbnail)
    end
    column "タイトル", :title
    column "カテゴリー", :category do |article|
      article.category
    end
      
    column "作成日", :created_at
    column "更新日", :updated_at
    actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :category]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs do
      f.input  :thumbnail, :as => :file
      f.input  :title
      f.input  :description, as: :quill_editor
      f.input  :category, as: :select, collection:Article.categories.keys
    end
    f.actions
  end
end

