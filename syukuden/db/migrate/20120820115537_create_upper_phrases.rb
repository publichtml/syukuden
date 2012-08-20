class CreateUpperPhrases < ActiveRecord::Migration
  def change
    create_table :upper_phrases do |t|
      t.text :content, :null => false
      t.boolean :available
      t.boolean :deleted

      t.timestamps
    end
  end
end
