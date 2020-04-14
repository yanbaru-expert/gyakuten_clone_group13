class SolutionsController < ApplicationController

   def index
     @solutions = Solution.all
    end

    def new
      @solution = Solution.new
    end

    def create
      Solution.create(solution_params)
    end

    private
    def solution_params
      params.require(:solution).permit(:answer)
    end

end
