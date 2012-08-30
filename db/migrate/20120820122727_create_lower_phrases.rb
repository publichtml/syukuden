class CreateLowerPhrases < ActiveRecord::Migration
  def change
    create_table :lower_phrases do |t|
      t.text :content, :null => false
      t.boolean :available, :default => true
      t.boolean :deleted, :default => false

      t.timestamps
    end
  end
end
