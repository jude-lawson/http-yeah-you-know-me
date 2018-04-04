class Request
  attr_reader :initial_line,
              :method,
              :path,
              :protocol,
              :headers,
              :body

  def initialize(lines_of_request)
    @lines_of_request = lines_of_request
    @initial_line = lines_of_request[0]
    @method = nil
    @path = nil
    @protocol = nil
    @headers = lines_of_request[1...-2]
    @body = lines_of_request[-1]
  end

  def parse_initial_line
    
  end

end