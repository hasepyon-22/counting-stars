require 'bundler/setup'
Bundler.require

if development?
  ActiveRecord::Base.establish_connection("sqlite3:db/development.db")
end

class User < ActiveRecord::Base
  has_secure_password
  validates :name,
    presence: true,
    format: {with: /\A\w+\z/}
  validates :password,
    length: {in: 5..10}

  has_many :counts, :through => :count_users
end

class Count < ActiveRecord::Base
  belongs_to :user
  has_many :users, :through => :count_users
end

class CountUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :count
end
