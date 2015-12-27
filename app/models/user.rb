class User < ActiveRecord::Base
  has_many :events, dependent: :destroy
  has_secure_password

  validates :name, presence: true, uniqueness: true, length: { maximum: 25 }
end
