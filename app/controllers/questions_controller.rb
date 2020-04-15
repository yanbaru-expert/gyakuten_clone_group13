class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash.notice = "質問を投稿しました。"
      redirect_to action: :index
    else
      flash.now[:alert] = "内容が入力されていません。"
      @questions = Question.all
      @question = Question.new
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
