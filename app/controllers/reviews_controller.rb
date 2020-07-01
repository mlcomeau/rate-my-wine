class ReviewsController < ApplicationController

    def new 
        @wine = Wine.find_by_id(params[:wine_id])
        @review = @wine.reviews.build
    end 

    def index 
        if params[:wine_id]
            @wine = Wine.find_by_id(params[:wine_id])
            @reviews = @wine.reviews
        else 
            @reviews = Review.all 
        end 
    end 

    def create
        @review = Review.new(review_params(:price, :stars, :content, :wine_id))
        @review.user_id = session[:user_id]
        if @review.save 
            redirect_to review_path(@review)
        else 
            flash[:message] = "Please fill in all fields!"
            render :new 
        end 
    end 

    def show 
        @review = Review.find_by_id(params[:id])
    end 

    private 

    def review_params(*args)
        params.require(:review).permit(*args)
    end 
end
