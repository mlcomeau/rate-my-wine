class RegionsController < ApplicationController
    
    def index 
        @regions = Region.alpha
    end 

end
