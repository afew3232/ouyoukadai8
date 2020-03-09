class BookComment < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :book, optional: true
	validates :body, presence: true
end
