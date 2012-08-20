class UpperPhrase < ActiveRecord::Base
  attr_accessible :available, :content, :deleted

  never_wastes
end
