# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :provider, :uid, :user_name, :screen_name

  def self.find_or_create_by_twitter_auth(auth_info)
  	find_or_create(
      :provider => auth_info['provider'],
      :uid => auth_info['uid'],
      :user_name => auth_info['info']['nickname'],
      :screen_name => auth_info['info']['name']
    )
  end

  def self.find_or_create_by_facebook_auth(auth_info)
    find_or_create(
      :provider => auth_info['provider'],
      :uid => auth_info['uid'],
      :user_name => auth_info['info']['nickname'],
      :screen_name => auth_info['info']['name']
    )
  end

  def formatted_name
    case provider
    when 'twitter'
     '@' + user_name
    when 'facebook'
      screen_name
    else
      '匿名希望'
    end
  end

  def icon_url
    # ToDo: 各サービスのURLがここにハードコードなのはよろしくない。helperかどこかに移動したい。
    case provider
    when 'twitter'
      # http://d.hatena.ne.jp/furyu-tei/20100615/1276542947
      # 48x48(pixel)
      "http://gadgtwit.appspot.com/twicon/#{user_name}/normal"
    when 'facebook'
      # https://developers.facebook.com/docs/reference/api/
      # 50x50(pixel)
      "https://graph.facebook.com/#{uid}/picture/square"
    else
      'icons/anonymous.png'
    end
  end

  private

  def self.find_or_create(user_info)
    if user = where(:provider => user_info[:provider], :uid => user_info[:uid]).first
      user.update_attributes!(
        :user_name => user_info[:user_name], 
        :screen_name => user_info[:screen_name]
      ) unless user.user_name == user_info[:user_name] && user.screen_name == user_info[:screen_name]
      user
    else
      create!(
        :provider => user_info[:provider],
        :uid => user_info[:uid],
        :user_name => user_info[:user_name],
        :screen_name => user_info[:screen_name]
      )
    end
  end
end
