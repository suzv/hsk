class AddCountToScore < ActiveRecord::Migration[5.2]
  def change
    add_column :scores, :score_count, :integer, default: 0
  end
end
