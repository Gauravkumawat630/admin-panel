class ApplicationController < ActionController::Base
 allow_browser versions: :modern
    skip_before_action :verify_authenticity_token

     def self.ransackable_attributes(_auth_object = nil)
    %w[id email created_at updated_at]

    def after_sign_in_path_for(resource)
      UserMailer.login_notification(resource).deliver_now
      super(resource)
    end
    
  end
end
