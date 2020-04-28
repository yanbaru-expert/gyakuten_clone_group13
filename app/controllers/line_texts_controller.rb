class LineTextsController < ApplicationController
  def index
    @line_texts = LineText.all
  end

  def show
    @line_text = LineText.find(params[:id])
  end
end
