class User < ActiveRecord::Base
  has_many :friends, :dependent => :destroy
  has_many :entries, :dependent => :destroy
end
