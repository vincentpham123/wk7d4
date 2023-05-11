class UsersController < ApplicationController


    def new 
        @user = User.new.decorate 
    end

    def create 

        @user=User.new(user_params).decorate
        if @user.save 
            flash[:notices] = ['Successful Login']
            login!(@user)
            render json: @user 
        else
            flash.now[:errors] = @user.errors.full_messages 
            @user= User.new(username: params[:user][:username]).decorate
            render :new
        end
    end

    
    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
