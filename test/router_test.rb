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

end