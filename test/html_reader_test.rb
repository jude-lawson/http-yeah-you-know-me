require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/html_reader'

class HTMLReaderTest < Minitest::Test
  def setup
    @reader = HTMLReader.new
  end

  def test_reader_exists
    assert_instance_of HTMLReader, @reader
  end

  def test_reader_can_read_index_html
    expected = "<!DOCTYPE html>
    <html>
    <head>
    </head>
      <body>
        <p>Hello, World! (#{request_count})</p>
      </body>
    </html>"
    assert_equal expected, @reader.read('index')
  end
end