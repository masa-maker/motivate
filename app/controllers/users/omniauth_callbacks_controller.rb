# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]
  def facebook
    authorization
   end
  
   def google_oauth2
    authorization
   end
  
   private
  
   def authorization
     motivate_info = User.from_omniauth(request.env["omniauth.auth"])
     @user = motivate_info[:user]

     if @user.persisted? #ユーザー情報が登録ずみのため、新規登録ではなくログイン処理を行う
      sign_in_and_redirect @user, event: :authentication
     else #ユーザー情報が未登録なので、新規登録画面へ遷移する
      @motivate_id = motivate_info[:motivate].id
      render template: 'devise/registrations/new'
     end

   end


  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
