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

  def test_response_to_root_returns_index_html
    expected = """
    <html>
      <head>
      </head>
      <body>
        <p>Hello, World! #{@request_count}</p>
      </body>
    </html>
    """
    assert_equal expected, @router.respond('/')
  end

end