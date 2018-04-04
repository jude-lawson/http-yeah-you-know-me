require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/request'

class RequestTest < Minitest::Test
  def setup
    lines_of_request = [
      "GET /hello HTTP/1.1\r\n",
      "Host: 'localhost:9292'\r\n",
      "Accept-Language: eng\r\n",
      "\r\n",
      "<html>
        <head></head>
        <body><p>Hello, World! (3)</p>
      </html>"
    ]
    @request = Request.new(lines_of_request)
  end

  def test_request_exists
    assert_instance_of Request, @request
  end

  def test_request_method
    expected = "GET"
    actual = @request.method
    assert_equal expected, actual
  end
  
  def test_request_path
    expected = "/hello"
    actual = @request.path
    assert_equal expected, actual
  end
  
  def test_request_protocol_version
    expected = "HTTP/1.1"
    actual = @request.protocol
    assert_equal expected, actual
  end
  
  def test_request_headers
    expected = {host: "localhost:9292", accept_language: "eng"}
    actual = @request.headers
    assert_equal expected, actual
  end
  
  def test_request_body
    expected = "<html><head></head><body><p>Hello, World! (3)</p></html>"
    actual = @response.body
    assert_equal expected, actual
  end

end