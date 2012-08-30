class DropUpperPhrasesAndLowerPhrases < ActiveRecord::Migration
  def up
  	drop_table :upper_phrases
  	drop_table :lower_phrases
  end

  def down
  	# 後戻りはできない
  end
end
