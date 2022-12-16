class CatsController < ApplicationController

    def index
        @cats = Cat.all
    end

    def update
        
    end

    def show
    end

    def create 
    end

    def edit
    end

    def new
    end

    private

    def cat_params
        params.require(:cat).permit(:name, :color, :birth_date, :sex)
    end
end
