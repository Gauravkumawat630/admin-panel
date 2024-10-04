ActiveAdmin.register Product do
   permit_params :name, :price, :description
   permit_params :name, :price, :user_id ,:description
  permit_params :name, :description, :price

  filter :name
  filter :price
 filter :description

  index do
    selectable_column
    id_column
    column :name
    column :price
   column :description
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :description
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :price
      row :description
    end
    active_admin_comments
  end
end
