class Phrase < ActiveRecord::Base
  attr_accessible :available, :content, :deleted, :type, :user_id

  never_wastes

  validates_presence_of :content

  def self.random
  	offset(rand(count)).first
  end
end
