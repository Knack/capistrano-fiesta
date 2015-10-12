require 'webmock/minitest'
require 'multi_json'

class WebMock::RequestStub
  def to_return_json(hash, options = {})
    options[:body] = MultiJson.dump(hash)
    options[:headers] = { content_type: "application/json" }
    to_return(options)
  end
end

# Don't raise but report uncaught net connections
WebMock.allow_net_connect!
WebMock.stub_request(:any, /.*/).to_return do |request|
  puts "\e[35mUNSTUBBED REQUEST:\e[0m #{request.method.upcase} #{request.uri}"
  { body: nil }
end
