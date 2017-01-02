require 'test_helper'

class BitoneApiTest < ActionDispatch::IntegrationTest
  test "book sale" do
    post "/sale",params: {total_amount:"1.0",descriptor:"teste",currency:"BRL",reference_tag:"testeCC"}
  end
end
