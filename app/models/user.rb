class User < ActiveRecord::Base
  has_many :friendships, :dependent => :destroy
  has_many :entries, :dependent => :destroy
end
