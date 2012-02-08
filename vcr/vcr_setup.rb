require 'vcr'

VCR.config do |c|
  c.cassette_library_dir = 'fixtures/cassettes'
  c.stub_with :fakeweb # or :webmock
  c.default_cassette_options = { :record => :once }
  c.filter_sensitive_data('<GREETING>') { 'Hello' }
  c.filter_sensitive_data('<LOCATION>', :my_tag) { 'World' }
  c.filter_sensitive_data('<PUBLIC-KEY>') do
    site_config.public_key
  end
end

