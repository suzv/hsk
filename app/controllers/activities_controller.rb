class ActivitiesController < ApplicationController
  def show
    @word = Activity.new.random_word
    @meaning = [@word.meaning, Activity.new.random_meaning, Activity.new.random_meaning].shuffle
    @pinyin = [@word.pinyin, Activity.new.random_pinyin, Activity.new.random_pinyin].shuffle
  end

  def next_check
    correct = params[:correct]
    playerScore = 0
    if correct.present?
      playerScore += 5
    else
      playerScore += 0
    end
  end
end
