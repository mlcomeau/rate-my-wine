class VarietalsController < ApplicationController
    def index 
        @varietals = Varietal.alpha
    end 
end
