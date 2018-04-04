require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/request'

class RequestTest < Minitest::Test
  def setup
    lines_of_request = [
      "GET /hello HTTP/1.1\r\n",
      "Host: localhost:9292\r\n",
      "Connection: keep-alive\r\n",
      "Cache-Control: max-age=0\r\n",
      "Upgrade-Insecure-Requests: 1\r\n",
      "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36\r\n",
      "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8\r\n",
      "Accept-Encoding: gzip, deflate, br\r\n",
      "Accept-Language: en-US,en;q=0.9\r\n"
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