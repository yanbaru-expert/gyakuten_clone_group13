class Question < ApplicationRecord
  has_many :solutions
  validates :body, :title, presence: true
end
