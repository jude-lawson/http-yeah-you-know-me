class HTMLReader

  def read(filename)
    file = File.read("./app/routes/#{filename}.html")
  end
end