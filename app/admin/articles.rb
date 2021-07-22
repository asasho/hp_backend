ActiveAdmin.register Article do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :description, :category
  
  filter :category, :as => :select, :collection => [["プレスリリース", 0], ["メディア", 1], ["その他", 2]]
    
  
  show do
    attributes_table do
      row(:title)
      row(:description)
      row(:category) do |article|
      if article.category == 0
         "プレスリリース"
      elsif article.category == 1
         "メディア"
      else 
         "その他"
      end
    end
      row(:created_at)
      row(:updated_at)
    end
  end
  
  index do
    selectable_column
    column(:id)
    
    column(:title)
    
    column(:category) do |article|
      if article.category == 0
         "プレスリリース"
      elsif article.category == 1
         "メディア"
      else 
         "その他"
      end
    end
      
    column(:created_at)
    column(:updated_at)
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
    f.inputs 'Article' do
      f.input :image, :as => :file, :hint => f.object.new_record? ? "" : f.template.image_tag(f.object.image.url(:thumb))
      f.input :title
      f.input :description, as: :quill_editor
      
      f.input :category, as: :select, collection:  {"プレスリリース": 1, "メディア": 2, "その他": 3}
        
    end
    f.actions
  end
end

