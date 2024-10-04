ActiveAdmin.register AdminUser do  
  permit_params :email, :password, :password_confirmation
 # permit_params :email, :other_attributes

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
ActiveAdmin.register User do
  permit_params :email, :name, :password, :password_confirmation
 
  action_item :send_welcome_email, only: :show do
    link_to 'Send Welcome Email', send_welcome_email_admin_user_path(user), method: :post if user
  end

  member_action :send_welcome_email, method: :post do
    user = User.find(params[:id])
    UserMailer.welcome_email(user).deliver_now
    redirect_to admin_user_path(user), notice: "send messege."
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    after_action :send_welcome_email, only: :create

    def send_welcome_email
      return unless resource.persisted?

     UserMailer.welcome_email(resource).deliver_now
    end
  end
end
