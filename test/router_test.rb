require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/router'

class RouterTest < Minitest::Test
  def setup
    @router = Router.new('/')
  end

  def test_router_exists
    assert_instance_of Router, @router
  end

  def test_route_to_root_returns_hello_world
    expected = "Hello World!"
    assert_equal expected, @router.route
  end
end