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
            @reviews = ReviewDecorator.decorate_collection(Review.most_recent)
        end 
    end 

    def create
        @review = Review.new(review_params)
        @review.user_id = session[:user_id]
        if @review.save 
            redirect_to wine_path(@review.wine_id)
        else
            render :new 
        end 
    end 


    private 
    def review_params
        params.require(:review).permit(:price, :stars, :content, :wine_id)
    end 

end
