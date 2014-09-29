class Textbook < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	validates :title, presence: true

	scope :search, lambda { |query| 
		where(["title LIKE ?", "%#{query}%"])
	}
end
