class User < ActiveRecord::Base
    has_secure_password
    has_many :videos
    validates_presence_of :username, :email
    validates_uniqueness_of :username, :email, { case_sensitive: false }
end