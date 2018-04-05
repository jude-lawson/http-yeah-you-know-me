class Request
  attr_reader :initial_line,
              :method,
              :path,
              :protocol,
              :headers,
              :body,
              :count

  def initialize(lines_of_request)
    @lines_of_request = lines_of_request
    @initial_line = lines_of_request[0]
    @method = nil
    @path = nil
    @protocol = nil
    @headers = lines_of_request[1...-2]
    @body = lines_of_request[-1]

    parse_initial_line
  end

  def parse_initial_line
    method_path_and_protocol = @initial_line.chomp.split(" ")
    @method = method_path_and_protocol[0]
    @path = method_path_and_protocol[1]
    @protocol = method_path_and_protocol[2]
  end
end