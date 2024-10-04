ActiveAdmin.register Order do
  permit_params :user_id, :product_id, :quantity, :total

  filter :total

  index do
    selectable_column
    id_column
    column :user
    column :product
    column :quantity
    column :total  
    actions
  end

  form do |f|
    f.inputs do
      f.input :user
      f.input :product
      f.input :quantity
    end
    f.actions
  end
end
