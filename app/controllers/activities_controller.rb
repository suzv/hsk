class ActivitiesController < ApplicationController
  # load_and_authorize_resource param_method: :check_params
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, :only => [:next_check]

  def show
    @word = Activity.new.random_word
    @meaning = [@word.meaning, Activity.new.random_meaning, Activity.new.random_meaning].shuffle
    @pinyin = [@word.pinyin, Activity.new.random_pinyin, Activity.new.random_pinyin].shuffle
  end

  def next_check
    @correct = params["param1"]
    @score = Score.find_by_user_id(params[:user_id])
    if @score.nil?
    @score = Score.new
    end
    playerScore = 0
    @score = playerScore
    if @correct.present?
      @score += 5
    else
      @score += 0
    end
    respond_to do |format|
      format.html { redirect_to activity_path(1) }
    end
  end

  private

  def check_params
    params.require(:activity).permit(:correct)
  end
end
