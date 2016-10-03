class User < ApplicationRecord
  include Gravtastic
  gravtastic
  has_secure_password

  has_many :thoughts

  validates_uniqueness_of :username, :message => Proc.new { |error, attributes|
    "#{attributes[:value]} has already been taken."
  }

  validates_uniqueness_of :email, :message => Proc.new { |error, attributes|
    "#{attributes[:value]} is already a registered email."
  }
  validates :name, presence: true
  validates :username, presence: true
  validates :email, presence: true
end
