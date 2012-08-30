class AddDefaultValueToUpperPhrases < ActiveRecord::Migration
  def change
  	change_column :upper_phrases, :available, :boolean, :default => true
  	change_column :upper_phrases, :deleted, :boolean, :default => false
  end
end
