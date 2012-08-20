class LowerPhrase < ActiveRecord::Base
  attr_accessible :available, :content, :deleted

  never_wastes

  validates_presence_of :content
end
