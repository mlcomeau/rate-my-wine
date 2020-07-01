class VarietalsController < ApplicationController
    def index 
        @varietals = Varietal.all 
    end 
end
