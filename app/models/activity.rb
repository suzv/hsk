class Activity < ApplicationRecord
  belongs_to :scores
  belongs_to :users

  def random_word
    random_offset = rand(Word.first.id..Word.last.id)
    random_word = Word.find(random_offset)
  end

  def random_meaning
    random_offset = rand(Meaning.first.id..Meaning.last.id)
    random_meaning = Meaning.find(random_offset)
  end

\
  def random_pinyin
    random_offset = rand(Pinyin.first.id..Pinyin.last.id)
    random_pinyin = Pinyin.find(random_offset)
  end
  
  def shuffle
    sort_by { rand }
  end
end
