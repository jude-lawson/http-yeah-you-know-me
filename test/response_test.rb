require 'minitest/autorun'
require 'minitest/pride'
require './lib/response'
require './lib/request'

class ResponseTest < Minitest::Test
  def setup
    lines_of_request = ["GET /hello HTTP/1.1\r\n","Host: localhost:9292\r\n","Connection: keep-alive\r\n","Cache-Control: max-age=0\r\n","Upgrade-Insecure-Requests: 1\r\n","User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36\r\n","Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8\r\n","Accept-Encoding: gzip, deflate, br\r\n","Accept-Language: en-US,en;q=0.9\r\n","\r\n","<html><head></head><body><p>Hello, World! (3)</p></html>"]
    request = Request.new(lines_of_request)
    @response = Response.new(request)
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