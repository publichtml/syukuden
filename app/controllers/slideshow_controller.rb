class SlideshowController < ApplicationController
  def index
  end

  def new
  end

  def show
  	@upper_phrase = UpperPhrase.random
  	@lower_phrase = LowerPhrase.random
  	@sender = User.find(@lower_phrase.user_id) if(@lower_phrase.user_id)
  end
end
