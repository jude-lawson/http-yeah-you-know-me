require 'minitest/autorun'
require 'minitest/pride'
require 'net/http'
require_relative '../lib/server_worker'

class ServerWorkerTest < Minitest::Test
  def setup
    @worker = ServerWorker.new(3000)
  end

  def test_server_worker_exists
    assert_instance_of ServerWorker, @worker
  end

  def test_server_worker_can_create_tcp_server
    server = @worker.create
    assert_instance_of TCPServer, server
    server.close
  end

  
  def test_server_responds_to_http_request_on_port_9292
    res = Net::HTTP.get_response(URI('http://localhost:9292'))
    assert res.body
  end

  def test_server_can_respond_with_hello_world_html
    res = Net::HTTP.get_response(URI('http://localhost:9292'))
    expected = "<html><head></head></body><p>Hello, World! (2)</p></body></html>"
    assert_equal expected, res.body
  end
  
  def test_that_server_records_number_of_responses
    res = Net::HTTP.get_response(URI('http://localhost:9292'))
    expected = "<html><head></head></body><p>Hello, World! (3)</p></body></html>"
    assert_equal expected, res.body
  end

end