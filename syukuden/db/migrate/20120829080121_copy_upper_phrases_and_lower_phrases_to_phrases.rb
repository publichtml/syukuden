class CopyUpperPhrasesAndLowerPhrasesToPhrases < ActiveRecord::Migration
  def up
  	execute "INSERT INTO phrases(type, content, available, deleted, created_at, updated_at) (SELECT 'UpperPhrase', content, available, deleted, created_at, updated_at FROM upper_phrases ORDER BY id);"
    execute "INSERT INTO phrases(type, content, available, deleted, created_at, updated_at) (SELECT 'LowerPhrase', content, available, deleted, created_at, updated_at FROM lower_phrases ORDER BY id);"
  end

  def down
  	# phrasesはコピー前は空の前提
  	execute "DELETE FROM phrases;"
  end
end
