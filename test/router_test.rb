require 'minitest/autorun'
require 'minitest/pride'
require './lib/router'
require './lib/response'
require 'socket'

class RouterTest < Minitest::Test
  def setup
    @router = Router.new
  end

  def test_router_exists
    assert_instance_of Router, @router
  end

  def test_route_to_root_returns_a_response_object
    assert_instance_of Response, @router.respond('/')
  end

end