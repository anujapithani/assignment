class FeedbackformsController < ApplicationController
    def index
       @feedbackforms = Feedbackform.all
    end

    def new
       @feedbackform =  Feedbackform.new
    end

    def create
       feedbackform =  Feedbackform.new(feedbackforms_params)
       feedbackform.save 
       redirect_to root_path
    end

    private
    def feedbackforms_params
        params.require(:feedbackform).permit(:name, :rating, :comments)
    end
end
