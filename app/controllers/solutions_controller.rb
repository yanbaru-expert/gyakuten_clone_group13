class SolutionsController < ApplicationController

  def create
    @question = Question.find_by(id: params[:question_id])
    @solution = @question.solutions.build(solution_params)

      if @solution.save
          redirect_to question_path(@question.id)
          flash[:notice] = "回答を投稿しました"
      else
        @solutions = Solution.all
        render "questions/show"
        flash.now[:alert] = "【回答】は空欄にできません"
       end

    end


    private
    def solution_params
      params.require(:solution).permit(:answer)
    end

end
