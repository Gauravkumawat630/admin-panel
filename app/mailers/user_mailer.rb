  # class UserMailer < ApplicationMailer

  #   default from: 'gauravkumawat630@gmail.com'

  #   def login_notification(user)
  #     @user = user
  #     mail(to: @user.email, subject: 'Login Notification')
  #   end
    
  #   default from: 'gauravkumawat630@gmail.com'
  
  #   def welcome_email(user)
  #     @user = user
  #     @url  = 'http://localhost:3000/admin/login'  
  #     mail(to: @user.email, subject: 'Welcome to My gaurav kumawat  application Site')
  #   end
  # end

  class UserMailer < ApplicationMailer
    default from: 'gauravkumawat630@gmail.com'
  
        
    def welcome_email(user)
      @user = user
      @url  = 'http://localhost:3000/admin/login'
  
      attachments['slides.pdf'] = File.read(Rails.root.join('C:\Users\kumaw\Downloads\slides.pdf'))
            #  attachments['gaurav.png'] = File.read(Rails.root.join())
              attachments['ram.jpg'] = File.read('C:\Users\kumaw\Downloads\ram.jpg')

      mail(to: @user.email, subject: 'Welcome to My Gaurav Kumawat Application Site') do |format|
        format.html { render 'welcome_email' }  
      end
    end
  end
  