class RailsTextsController < ApplicationController

  def index
    @rails_texts = RailsText.all
  end

  def show
    @Rails_text = RailsText.find(params[:id])
  end

end
