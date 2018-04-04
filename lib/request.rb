class Request

  def initialize(lines_of_request)
    # Method
    # Path
    # Version of protocol
    # Headers hash
    # Body string
  end

  def parse_request
    # Go through each line of request
    # First is status
    # Each after has key based on words before first :
    # return a response object
  end

end