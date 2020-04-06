class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :blogs
  has_many :blog_comments, through: :blogs
  has_many :stamps, through: :blogs
  has_many :topics
  has_many :topic_comments, through: :topics
end