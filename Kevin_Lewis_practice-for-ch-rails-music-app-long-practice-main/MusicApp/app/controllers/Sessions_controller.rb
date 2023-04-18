class SessionsController < ApplicationController
    def create
        user = User.find_by_credentials(parms[:user][:username], params[:user][:password])
        if user.nil?
            flash.now[:errors] = "Invalid email or password"
            render :new
        else
            login!(user)
            redirect_to user_path(user)
        end
    end

    def destroy
        session.delete(:session_token)
        redirect_to root_path
      end

end
