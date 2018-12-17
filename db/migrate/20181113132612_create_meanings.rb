class CreateMeanings < ActiveRecord::Migration[5.2]
  def change
    create_table :meanings do |t|
      t.string :meaning
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
