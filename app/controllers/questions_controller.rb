class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to action: :index
    else
      render :index
    end
  end

  def show 
    @question = Question.find(params[:id])
    @solutions = @question.solutions.all
  end

  private
  def question_params
    params.permit(:title, :body)
  end

end
