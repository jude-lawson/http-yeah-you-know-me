class Response
  def initialize()
  end

  def headers
    "HTTP/1.1 200 ok\r\nContent-Length: 0\r\n\r\n"
  end

  def body(path)
    # case statement based on path from router
    # returns body html output (later based on templates)
    case path
    when 'index'
    "<html><head></head><body><p>Hello, World! (_requestCount_)</p></body></html>"
    end
  end
end