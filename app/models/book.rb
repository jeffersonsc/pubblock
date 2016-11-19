class Book < ApplicationRecord
	belongs_to :user
	mount_uploader :book_file, BookFileUploader

	validates :title, :description, :book_file, presence: true
end
