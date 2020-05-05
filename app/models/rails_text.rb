class RailsText < ApplicationRecord

  def search
    if params[:genre].present?
      @rails_texts = RailsText.where('genre LIKE ?', "%#{params[:genre]}%")
    else
      @rails_texts = RailsText.none
    end
  end

end
