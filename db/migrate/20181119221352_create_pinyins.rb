class CreatePinyins < ActiveRecord::Migration[5.2]
  def change
    create_table :pinyins do |t|
      t.string :pinyin
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
