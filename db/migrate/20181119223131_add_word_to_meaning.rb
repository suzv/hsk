class AddWordToMeaning < ActiveRecord::Migration[5.2]
  def change
    add_reference :meanings, :word, foreign_key: true
  end
end
