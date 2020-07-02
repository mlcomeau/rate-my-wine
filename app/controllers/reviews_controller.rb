class ReviewsController < ApplicationController

    def new
        if logged_in? 
            @wine = Wine.find_by_id(params[:wine_id])
            @review = @wine.reviews.build
        else 
            flash[:message] = "You have to be logged in to do that."
            redirect_to login_path 
        end 
    end 

    def index 
        if @wine = Wine.find_by_id(params[:wine_id])
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
