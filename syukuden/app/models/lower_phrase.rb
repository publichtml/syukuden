class LowerPhrase < ActiveRecord::Base
  # ToDo: 早めにUpperPhraseと単一テーブル継承にする
  attr_accessible :available, :content, :deleted

  never_wastes

  validates_presence_of :content

  def self.random
  	offset(rand(count)).first
  end
end
