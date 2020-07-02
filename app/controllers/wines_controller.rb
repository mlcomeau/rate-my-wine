class WinesController < ApplicationController

    def index 
        @wines = Wine.all
    end 

    def new 
        @wine = Wine.new 
        @wine.build_region
        @wine.build_varietal
    end 

    def create 
        @wine = Wine.new(wine_params(:name, :color, :year, :varietal_id, :region_id, varietal_attributes: [:name], region_attributes: [:name]))
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
    def wine_params(*args)
        params.require(:wine).permit(*args)
    end 
end
