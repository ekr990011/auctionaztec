class User < ApplicationRecord
  validates_uniqueness_of :username
  has_secure_password
  
  has_many :auctions
  has_many :bids, dependent: :destroy  
  
  def admin?
    self.role == 'admin'
  end
  
end
