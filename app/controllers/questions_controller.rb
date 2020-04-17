class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @solutions = @question.solutions.all
    @solution  = @question.solutions.new
  end

end
