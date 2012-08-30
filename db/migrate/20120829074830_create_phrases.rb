class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :type
      t.text :content, :null => false
      t.boolean :available, :null => false, :default => true
      t.boolean :deleted, :null => false, :default => false

      t.timestamps
    end
  end
end
