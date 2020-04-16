class SolutionsController < ApplicationController

  def create
            question = Question.find_by(id: params[:question_id])
            @solution = question.solutions.build(solution_params)
            if @solution.save
                redirect_to question_path(question.id)
            else
                render "questions/show"
            end
        end

    private
    def solution_params
      params.require(:solution).permit(:answer)
    end

end
