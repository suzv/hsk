class ActivitiesController < ApplicationController
  load_and_authorize_resource param_method: :check_params
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, :only => [:next_check]

  def show
    @word = Activity.new.random_word
    @meaning = [@word.meaning, Activity.new.random_meaning, Activity.new.random_meaning].shuffle
    @pinyin = [@word.pinyin, Activity.new.random_pinyin, Activity.new.random_pinyin].shuffle
  end

  def next_check
    @correct = params["param1"]

    @score = Score.find(params[:user_id])
    @newscore = Score.new


    playerScore = 0
    if @correct.present?
      playerScore += 5
    else
      playerScore += 0
    end
    redirect_to activity_path(show)
  end

  private

  def check_params
    params.require(:activity).permit(:correct)
  end
end
