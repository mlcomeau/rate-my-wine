class SessionsController < ApplicationController

    def welcome 
        wines = Wine.latest_three
        @wines = WineDecorator.decorate_collection(wines)
    end 
    
    def new 
    end 

    def create  
        if auth_hash = request.env["omniauth.auth"]
            @user = User.find_or_create_by_omniauth(auth_hash)
            session[:user_id] = @user.id  
            redirect_to user_path(@user)
        else 
            @user = User.find_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id 
                redirect_to user_path(@user)
            else 
                flash[:message] = "Incorrect username and/or password."
                redirect_to login_path 
            end
        end  
    end 

    def destroy 
        session.clear 
        flash[:message] = "You have been logged out."
        redirect_to root_path
    end 
end
