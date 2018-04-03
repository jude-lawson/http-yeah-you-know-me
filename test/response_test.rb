require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/response'

class ResponseTest < Minitest::Test
  def setup
    @response = Response.new
  end

  def test_response_object_exists
    assert_instance_of Response, @response
  end

  def test_it_returns_valid_headers
    # return a string with 
  end

  def test_headers_has_status_line
  end
  
  def test_headers_has_some_header_information
  end

  def test_headers_ends_with_newline
  end

  def test_it_returns_appropriate_response_to_root
    expected = "<html><head></head><body><p>Hello, World! (_someRegExp_)</p></body></html>"
    assert_equal expected, @response.body('/')
  end

  def test_it_returns_appropriate_response_to_hello
  end
end