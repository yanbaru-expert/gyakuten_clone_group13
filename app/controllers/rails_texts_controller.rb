class RailsTextsController < ApplicationController
    before_action :authenticate_user!
  def index
    @rails_texts = RailsText.all
  end

  def show
    @rails_text = RailsText.find(params[:id])
  end

end
