require 'minitest/autorun'
require 'minitest/pride'
require './lib/router'
require 'socket'

class RouterTest < Minitest::Test
  def setup
    @router = Router.new
  end

  def test_router_exists
    assert_instance_of Router, @router
  end

  def test_response_to_root_returns_index_html
    expected = "<!DOCTYPE html>\n<html>\n<head>\n</head>\n  <body>\n    <p>Hello, World! (0)</p>\n  </body>\n</html>"
    assert_equal expected, @router.respond('/')
  end

end