class AwsTextsController < ApplicationController
	def index
		@aws_texts = AwsText.all
	end
end