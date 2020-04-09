class Blog < ApplicationRecord
	belongs_to :user
	has_many :blog_comments
	has_many :stamps

	validates :title, length: {minimum: 1, maximum: 100}
	validates :content, length: {minimum: 2}

	attachment :eyecatch_img
	acts_as_taggable
end
