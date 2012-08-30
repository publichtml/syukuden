class SlideshowController < ApplicationController
  def index
  end

  def new
  end

  def show
  	@upper_phrase = UpperPhrase.random
  	@lower_phrase = LowerPhrase.random
  end
end
