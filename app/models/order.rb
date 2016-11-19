class Order < ApplicationRecord
  belongs_to :user
  belongs_to :book

	mount_uploader :file, OderFileUploader

end
