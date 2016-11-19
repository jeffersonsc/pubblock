class AuthenticationFile
	def initialize(book)
		@book = book
	end
	
	def exec
		hash = Digest::MD5.hexdigest b.book_file.read
		@book.update(authentication: hash)

		#TODO colocar código de publicar no block chain
	end
	
end