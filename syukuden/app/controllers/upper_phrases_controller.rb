class UpperPhrasesController < ApplicationController
  # GET /upper_phrases
  # GET /upper_phrases.json
 
  before_filter :authenticate_user!

  def index
    @upper_phrases = UpperPhrase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @upper_phrases }
    end
  end

  # GET /upper_phrases/1
  # GET /upper_phrases/1.json
  def show
    @upper_phrase = UpperPhrase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @upper_phrase }
    end
  end

  # GET /upper_phrases/new
  # GET /upper_phrases/new.json
  def new
    @upper_phrase = UpperPhrase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upper_phrase }
    end
  end

  # GET /upper_phrases/1/edit
  def edit
    @upper_phrase = UpperPhrase.find(params[:id])
  end

  # POST /upper_phrases
  # POST /upper_phrases.json
  def create
    @upper_phrase = UpperPhrase.new(params[:upper_phrase])
    @upper_phrase.user_id = current_user.id

    respond_to do |format|
      if @upper_phrase.save
        format.html { redirect_to @upper_phrase, notice: 'Upper phrase was successfully created.' }
        format.json { render json: @upper_phrase, status: :created, location: @upper_phrase }
      else
        format.html { render action: "new" }
        format.json { render json: @upper_phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /upper_phrases/1
  # PUT /upper_phrases/1.json
  def update
    @upper_phrase = UpperPhrase.find(params[:id])

    respond_to do |format|
      if @upper_phrase.update_attributes(params[:upper_phrase])
        format.html { redirect_to @upper_phrase, notice: 'Upper phrase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @upper_phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /upper_phrases/1
  # DELETE /upper_phrases/1.json
  def destroy
    @upper_phrase = UpperPhrase.find(params[:id])
    @upper_phrase.destroy

    respond_to do |format|
      format.html { redirect_to upper_phrases_url }
      format.json { head :no_content }
    end
  end
end
