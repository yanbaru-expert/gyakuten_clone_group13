class QuestionsController < ApplicationController

  def index
    @question = Question.new
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
      render :index
    end
  end

  def show
    @question = Question.find(params[:id])
    @solutions = @question.solutions.all
    @solution  = @question.solutions.new
  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end

end
