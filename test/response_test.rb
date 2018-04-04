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

  def test_response_has_path
    @response.set_path
    assert_equal expected, @response.path
  end

  def test_response_has_url
    @response.set_url
    assert_equal expected, @response.url
  end

  def test_response_has_status_line
    @response.set_status_line
    assert_equal expected, @response.status_line
  end

  def test_response_has_headers
    @response.set_headers
    assert_equal expected, @response.headers
  end

  def test_response_has_body
    @response.set_body
    assert_equal expected, @response.body
  end

end