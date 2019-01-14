class ActivitiesController < ApplicationController
  def show
    @word = Activity.new.random_word
    @meaning = [@word.meaning, Activity.new.random_meaning, Activity.new.random_meaning].shuffle
    @pinyin = [@word.pinyin, Activity.new.random_pinyin, Activity.new.random_pinyin].shuffle
  end

end
