require 'minitest/autorun'
require 'minitest/pride'
require './lib/response'
require './lib/request'
require './lib/router'

class ResponseTest < Minitest::Test
  def setup
    lines_of_request = ["GET /hello HTTP/1.1\r\n","Host: localhost:9292\r\n","Connection: keep-alive\r\n","Cache-Control: max-age=0\r\n","Upgrade-Insecure-Requests: 1\r\n","User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36\r\n","Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8\r\n","Accept-Encoding: gzip, deflate, br\r\n","Accept-Language: en-US,en;q=0.9\r\n","\r\n","<html><head></head><body><p>Hello, World! (3)</p></html>"]
    request = Request.new(lines_of_request)
    @response = Response.new(request, 0)
  end

  def test_response_object_exists
    assert_instance_of Response, @response
  end

  # If we don't need to read this anywhere in source, remove test and getter
  # to improve attribute encapsulation
  def test_response_object_has_valid_router
    assert_instance_of Router, @response.router
  end

  def test_response_can_read_request_path
    assert_equal '/hello', @response.path
  end

  def test_response_can_read_method
    assert_equal 'GET', @response.method
  end

  def test_response_can_read_protocol
    assert_equal 'HTTP/1.1', @response.protocol
  end

  def test_response_has_status_line
    expected = "HTTP/1.1 200 OK"
    assert_equal expected, @response.status_line
  end

  def test_response_has_headers
    expected = ["Date: #{Time.now}","Server: ruby","Content-Type: text/html, charset=utf-8","Content-Length: #{@response.body.length}","\r\n"]
    assert_equal expected, @response.headers
  end

end