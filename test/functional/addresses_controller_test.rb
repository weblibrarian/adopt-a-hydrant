require 'test_helper'

class AddressesControllerTest < ActionController::TestCase
  test 'should return latitude and longitude for a valid address' do
    stub_request(:get, "http://maps.google.com/maps/geo").
      with(:query => {:key => "AIzaSyC4NLVPQiMG6i4hSg2Q4vrpRY2IBbAEjwc", :oe => "utf-8", :output => "xml", :q => "Anchorage City Mayor, Anchorage, AK"}).
      to_return(body: File.read(File.expand_path('../../fixtures/city_hall.kml', __FILE__)))
    get :show, address: 'City Hall', city_state: "Anchorage, AK"
    assert_not_nil assigns :address
  end

  test 'should return an error for an invalid address' do
    stub_request(:get, "http://maps.google.com/maps/geo").
      with(:query => {:key => "AIzaSyC4NLVPQiMG6i4hSg2Q4vrpRY2IBbAEjwc", :oe => "utf-8", :output => "xml", :q => ", "}).
      to_return(body: File.read(File.expand_path('../../fixtures/unknown_address.kml', __FILE__)))
    get :show, address: '', city_state: ''
    assert_response :missing
  end
end
