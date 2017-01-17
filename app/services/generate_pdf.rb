class GeneratePdf
	def initialize(order)
		@order = order
		@book = order.book
		@consumer = order.user
	end

	def exec
		prawn_file = "/tmp/#{@consumer.id}-temp-#{@book.book_file_identifier}"
		path = "/tmp/#{@consumer.id}-#{@book.book_file_identifier}"
		filename = "#{Rails.root}/public#{@book.book_file.url}"
		consumerx = @consumer.id
		
		Prawn::Document.generate(prawn_file) do
		  text "Esse livro é propriedade de PubBlock - Usuário #{consumerx}", :align => :center
		end

		pdf = CombinePDF.new
		pdf << CombinePDF.load(prawn_file)
		pdf << CombinePDF.load(filename)
		pdf.save path

		File.open(path) do |f|
		  @order.file = f
		end

		@order.save!

		hash = Digest::MD5.hexdigest @order.file.read
		@order.update(authentication: hash)

		#TODO chamar transação no block chain
		#New Hash, Usuário
		BlockChainManager.new.buyBook(@book.authentication,@book.user.fullname,@order.user.email, "12312312312")
	end
	
	
end