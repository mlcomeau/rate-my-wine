class WinesController < ApplicationController

    def index 
        if params[:varietal_id]
            @wines = Varietal.find(params[:varietal_id]).wines 
        elsif params[:region_id]
            @wines = Region.find(params[:region_id]).wines 
        else 
            @wines = Wine.alpha
        end 
    end 

    def new 
        if logged_in?
            @wine = Wine.new 
            @wine.reviews.build
        else
            flash[:message] = "You have to be logged in to do that."
            redirect_to login_path 
        end   
    end 

    def create 
        @wine = Wine.new(wine_params)
        if @wine.save 
            redirect_to wine_path(@wine)
        else 
            render :new 
        end 
    end 

    def show 
        @wine = Wine.find(params[:id])
    end 

    private 
    def wine_params
        params.require(:wine).permit(:name, :color, :year, :varietal_id, :region_id, reviews_attributes: [:price, :stars, :content])
    end 
end
