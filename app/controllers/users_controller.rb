class UsersController < InheritedResources::Base

  private

    def user_params
      params.require(:user).permit(:name, :email, :password_digest, :password_confirmation)
    end
    def create
      
    #  UserMailer.welcome_email('gauravkumawat631@mail.com').deliver_now
    end
end
