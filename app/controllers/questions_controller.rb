class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def create
    @question = Question.create!(title:params[:title], body:params[:body])
  end

  def show 
    @question = Question.find(params[:id])
    @solutions = @question.solutions.all
  end
end
