class Stamp < ApplicationRecord
	belongs_to :user
	belongs_to :blog
end