class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :favorited, source_type: 'Post'
end
