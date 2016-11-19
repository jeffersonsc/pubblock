require 'rest-client'
require 'json'

class BlockChainManager
	def queryBook(id)
		begin	
			logarBlockChain
			r = RestClient.post('https://80e72aada9224204a8c94042b563a3f8-vp0.us.blockchain.ibm.com:5001/chaincode', {
			  jsonrpc: "2.0",
			  method: "query",
			  params: {
			    type: 1,
			    chaincodeID: {
			      name: "16e655c0fce6a9882896d3d6d11f7dcd4f45027fd4764004440ff1e61340910a9d67685c4bb723272a497f3cf428e6cf6b009618612220e1471e03b6c0aa76cb"
			    },
			        ctorMsg: {
			            function: "read",
			            args: [
			                "#{id}"
			            ]
			        },
			        secureContext: "admin"
			    },
			  id: 0
			}.to_json, {content_type: 'application/json', accept: :json, :user_agent => "Postman 2.0"})
			puts r.body
		rescue RestClient::ExceptionWithResponse => e
 			p e
 		end
	end	
	
	def buyBook(livro,autor,email,cpf)		
		begin	
			logarBlockChain
			r = RestClient.post('https://80e72aada9224204a8c94042b563a3f8-vp0.us.blockchain.ibm.com:5001/chaincode', {
			  jsonrpc: "2.0",
			  method: "invoke",
			  params: {
			    type: 1,
			    chaincodeID: {
			      name: "16e655c0fce6a9882896d3d6d11f7dcd4f45027fd4764004440ff1e61340910a9d67685c4bb723272a497f3cf428e6cf6b009618612220e1471e03b6c0aa76cb"
			    },
			        ctorMsg: {
			            function: "init_marble",
			            args: [
			                "#{livro}", "#{autor}", "#{email}", "#{cpf}"
			            ]
			        },
			        secureContext: "admin"
			    },
			  id: 0
			}.to_json, {content_type: 'application/json', accept: :json, :user_agent => "Postman 2.0"})
			puts r.body
		rescue RestClient::ExceptionWithResponse => e
 			p e
 		end
	end

	def createBook(hash_livro_original, autor, titulo, descricao)			
		begin	
			logarBlockChain
			r = RestClient.post('https://80e72aada9224204a8c94042b563a3f8-vp0.us.blockchain.ibm.com:5001/chaincode', {
				  jsonrpc: "2.0",
				  method: "invoke",
				  params: {
				    type: 2,
				    chaincodeID: {
				      name: "dfc74e1d2544612828ec99295946a9e352ce689668b0f5c9a4eb587b4858ca2812c0bddd171004b09acf9ea0c1d0f55ddd410ad5856a5189c291cc9cc957f018"
				    },
				        ctorMsg: {
				            function: "init_marble",
				            args: [
				                "#{hash_livro_original}", "#{autor}", "#{titulo}", "#{descricao}"
				            ]
				        },
				        secureContext: "admin"
				    },
				  id: 0
				}.to_json, {content_type: 'application/json', accept: :json, :user_agent => "Postman 2.0"})
			puts r.body
		rescue RestClient::ExceptionWithResponse => e
 			p e
 		end
	end

	def logarBlockChain
		begin
			r = RestClient.post('https://80e72aada9224204a8c94042b563a3f8-vp0.us.blockchain.ibm.com:5001/registrar', {'enrollId'=> 'admin', 'enrollSecret' => 'f5399e07a3'}.to_json, {content_type: 'application/json', accept: :json, :user_agent => "Postman 2.0"})
			puts r.code
		rescue RestClient::ExceptionWithResponse => e
 			p e
 		end
	end
	
end