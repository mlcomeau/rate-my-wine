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
        @wine = Wine.new 
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
