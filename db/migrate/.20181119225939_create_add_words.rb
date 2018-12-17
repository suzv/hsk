class CreateAddWords < ActiveRecord::Migration[5.2]
  def change
    create_table :add_words do |t|
      t.string :word
      t.string :meaning
      t.string :pinyin

      t.timestamps
    end
  end
end
