require 'minitest/autorun'
require 'minitest/pride'
require './lib/router'
require 'socket'
require './lib/request'

class RouterTest < Minitest::Test
  def setup
    lines_of_request = ["GET /hello HTTP/1.1\r\n","Host: localhost:9292\r\n","Connection: keep-alive\r\n","Cache-Control: max-age=0\r\n","Upgrade-Insecure-Requests: 1\r\n","User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36\r\n","Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8\r\n","Accept-Encoding: gzip, deflate, br\r\n","Accept-Language: en-US,en;q=0.9\r\n","\r\n","<html><head></head><body><p>Hello, World! (3)</p></html>"]
    @request = Request.new(lines_of_request)
    @router = Router.new
  end

  def test_router_exists
    assert_instance_of Router, @router
  end

  def test_response_to_root_returns_index_html_and_diagnostics
    expected = "<!DOCTYPE html>\n<html>\n<head>\n</head>\n  <body>\n    <p>Hello, World! (0)</p>\n  </body>\n</html>"
    assert_equal expected, @router.respond('/', @request)
  end

end