require 'test_helper'

class ListingZombiesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup { host! 'api.example.com'}
  test 'returns list of all zombies' do
  	get '/zombies'
  	assert_equal 200, response.status
  	refute_empty response.body
  end


end
