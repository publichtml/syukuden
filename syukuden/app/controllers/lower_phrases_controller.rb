class LowerPhrasesController < ApplicationController
  # ToDo: UpperPhraseControllerとLowerPhraseControllerに別れているが、
  #       これは一つのPhraseControllerに統合した方が良さそう
  #       (リンクは相変わらず「上の句」と「下の句」に分けて、どちらかをGETで持ち回す)
  # GET /lower_phrases
  # GET /lower_phrases.json
  def index
    @lower_phrases = LowerPhrase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lower_phrases }
    end
  end

  # GET /lower_phrases/1
  # GET /lower_phrases/1.json
  def show
    @lower_phrase = LowerPhrase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lower_phrase }
    end
  end

  # GET /lower_phrases/new
  # GET /lower_phrases/new.json
  def new
    @lower_phrase = LowerPhrase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lower_phrase }
    end
  end

  # GET /lower_phrases/1/edit
  def edit
    @lower_phrase = LowerPhrase.find(params[:id])
  end

  # POST /lower_phrases
  # POST /lower_phrases.json
  def create
    @lower_phrase = LowerPhrase.new(params[:lower_phrase])
    @lower_phrase.user_id = current_user.id

    respond_to do |format|
      if @lower_phrase.save
        format.html { redirect_to @lower_phrase, notice: 'Lower phrase was successfully created.' }
        format.json { render json: @lower_phrase, status: :created, location: @lower_phrase }
      else
        format.html { render action: "new" }
        format.json { render json: @lower_phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lower_phrases/1
  # PUT /lower_phrases/1.json
  def update
    @lower_phrase = LowerPhrase.find(params[:id])

    respond_to do |format|
      if @lower_phrase.update_attributes(params[:lower_phrase])
        format.html { redirect_to @lower_phrase, notice: 'Lower phrase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lower_phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lower_phrases/1
  # DELETE /lower_phrases/1.json
  def destroy
    @lower_phrase = LowerPhrase.find(params[:id])
    @lower_phrase.destroy

    respond_to do |format|
      format.html { redirect_to lower_phrases_url }
      format.json { head :no_content }
    end
  end
end
