class UsersController < ApplicationController

    def new 
        @user = User.new
    end 

    def create 
        @user = User.(user_params(:username, :password))
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            render :new
        end 
    end

    def show 
        @user = User.find(params[:id])
    end 
    



    private 

    def user_params(*args)
        params.require(:user).permit(*args)
    end 

end
