class SessionsController < ApplicationController

    def new
        @user =User.new.decorate 
    end

    def create
        @user=User.find_by_credentials(params[:user][:username],params[:user][:password])
        
        if @user 
            login!(@user)
            flash[:notices]=['Sucessful Login']
            redirect_to subs_url 
        else
            flash.now[:errors]=@user.errors.full_messages
            @user=User.new(username: params[:user][:username]).decorate 
            render :new 
        end

    end

    def destroy 
        logout!
        flash[:notices]=['Successful Logout']
        redirect_to new_sessions_url
    end

    def user_params 
        params.require(:user).permit(:username, :password)
    end
end
