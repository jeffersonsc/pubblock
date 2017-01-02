require 'rest-client'
require 'json'

class BitoneApi
	def sale(parameters = {})
		begin
			r = RestClient.post('https://80e72aada9224204a8c94042b563a3f8-vp0.us.blockchain.ibm.com:5001/chaincode', {
			  jsonrpc: "2.0",
			  method: "invoke",
			  params: {
			  		merchantId: "39",
					merchantKey: "AEqPNGczfB4hcnSn6dl++3V2Bv5Mbolq+EHDvxjqWMo=",
					order: {
						sale: {
							options: {
								saveClient: "false"
							},
							totalAmount: "#{parameters[:total_amount] || ''}",
							shippingAmount: "",
							iataFee: "#{parameters[:iata_fee] || ''}",
							descriptor: "#{parameters[:descriptor] || ''}",
							currency: "#{parameters[:currency] || ''}",
							referenceTag: "#{parameters[:reference_tag] || ''}",
							creditPayment: {
								creditClientName: "ALBERTO A DA SILVA",
								creditNumber: "4111111111111111",
								creditExpirationMonth: "02",
								creditExpirationYear: "2019",
								creditCvv: "123",
								creditInstallments: "1",
								creditChargeInterest: "1"
							}
						}
					}
			}.to_json, {content_type: 'application/json', accept: :json, :user_agent => "Postman 2.0"})
			puts r.body
		rescue RestClient::ExceptionWithResponse => e
 			p e
 		end
	end
end