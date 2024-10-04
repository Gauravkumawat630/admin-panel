ActiveAdmin.register User do
  permit_params :name, :email 

  filter :name_cont, label: 'Name' 
  filter :email_cont, label: 'Email' 

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :total
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
    end
    f.actions
  end
  permit_params :email, :name, :other_attributes 

  after_create do |user|
    UserMailer.welcome_email(user).deliver_now

    Rails.logger.info "New user created: #{user.email} at #{Time.current}"
  end

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :name
    end
    f.actions
  end
end