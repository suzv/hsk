class Word < ApplicationRecord
  has_one :meaning
  has_one :pinyin
  accepts_nested_attributes_for :meaning
  accepts_nested_attributes_for :pinyin
end
