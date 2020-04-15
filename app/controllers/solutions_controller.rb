class SolutionsController < ApplicationController

    def create
      Solution.create(solution_params)
    end

    private
    def solution_params
      params.require(:solution).permit(:answer)
    end

end
