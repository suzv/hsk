class WordsController < ApplicationController
   # before_action :set_word, only: [:show, :edit, :update, :destroy]

  # GET /add_words
  # GET /add_words.json
  def index
    @words = Word.all
  end

  # GET /add_words/1
  # GET /add_words/1.json
  def show
  end

  # GET /add_words/new
  def new
    @word = Word.new
    @word.meaning = Meaning.new
    @word.pinyin = Pinyin.new
  end

  # GET /add_words/1/edit
  def edit
  end

  # POST /add_words
  # POST /add_words.json
  def create

    @word = Word.new(word_params)

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'word was successfully created.' }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /add_words/1
  # PATCH/PUT /add_words/1.json
  def update

    respond_to do |format|
      if @word.update_attributes(word_params)
        format.html { redirect_to @word, notice: 'word was successfully updated.' }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /add_words/1
  # DELETE /add_words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url, notice: 'word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:word, meaning_attributes: [:id, :meaning], pinyin_attributes: [:id, :pinyin])
    end
end
