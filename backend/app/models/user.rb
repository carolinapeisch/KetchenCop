class User < ActiveRecord::Base
  has_one :contact
  has_many :purchases
end
