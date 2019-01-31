class ActivitiesController < ApplicationController
  # load_and_authorize_resource param_method: :check_params
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, :only => [:next_check]

  def show
    @score = Score.where(user_id: current_user.id).last
    if @score.nil? == false
      word_count = current_user.scores.last.score_count.to_i
      if word_count == 10
        @word_count = 1
      else
        @word_count = word_count + 1
      end
    else
      @word_count = 1
    end


    @word = Activity.new.random_word
    @meaning = [@word.meaning, Activity.new.random_meaning, Activity.new.random_meaning].shuffle
    @pinyin = [@word.pinyin, Activity.new.random_pinyin, Activity.new.random_pinyin].shuffle
  end

  def calendar

    @score = Score.where(user_id: current_user.id)
    @score_calendar = [{"title" => "DÍA DE HSK!!", "start" => "2019-03-23", "color" => "B83A3B"},{"title" => "DÍA DE HSK!!", "start" => "2019-07-13", "color" => "B83A3B"},{"title" => "DÍA DE HSK!!", "start" => "2019-12-01", "color" => "B83A3B"}]
    @score.each do |e|
      @score_calendar << {"title" => "Puntaje: #{e.score}", "start" => "#{e.created_at.to_date}"}
    end

  end

  def next_check
    @correct = params["param1"].to_i
    @score = Score.where(user_id: current_user.id).last

    if @score.nil? or @score.score_count == 10
      @score = Score.new
      @score.user = current_user
      @score.save
    end

    if @correct.present?
      if @correct == 1
        @score.score += 5
      end
      if @correct == 2
        @score.score += 10
      end
      if @correct == 0
        @score.score += 0
      end
    else
      @score.score += 0
    end
    @score.score_count += 1

    if @score.save && @score.score_count < 10
      respond_to do |format|
        format.html { redirect_to activity_path(1) }
      end
    else
      respond_to do |format|
        format.html { redirect_to activities_finish_path }
      end
    end

  end

  private

  def check_params
    params.require(:activity).permit(:correct)
  end
end
