class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :provider, :uid

  def self.find_or_create_by_twitter_auth(auth_info)
  	find_or_create(auth_info['provider'], auth_info['uid'])
  end

  def self.find_or_create_by_facebook_auth(auth_info)
  	find_or_create(auth_info['provider'], auth_info['uid'])
  end

  private

  def self.find_or_create(provider, uid)
  	where(
  		provider: provider,
  		uid: uid
  	).first_or_create
  end

end
