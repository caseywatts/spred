class Illness < ActiveRecord::Base
  has_one :user
  has_many :entries, :dependent => :destroy
end
