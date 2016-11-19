class Book < ApplicationRecord
	belongs_to :user
	has_many :orders
	mount_uploader :book_file, BookFileUploader

	validates :title, :description, :book_file, presence: true
end
