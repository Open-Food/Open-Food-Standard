module JsonHelper
  def json_response
    @json_response ||= ActiveSupport::JSON.decode(response.body)
  end
end

RSpec.configure do |config|
  config.include JsonHelper
end
