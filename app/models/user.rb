class User < ActiveRecord::Base
  has_many :events, dependent: :destroy
  has_secure_password
end
