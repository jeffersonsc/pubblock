class AuthenticationFile
	def initialize(book)
		@book = book
	end
	
	def exec
		hash = Digest::MD5.hexdigest @book.book_file.read
		@book.update(authentication: hash)

		#TODO colocar código de publicar no block chain
		BlockChainManager.new.createBook(@book.authentication, @book.user.fullname, @book.title, @book.description)
	end
	
end