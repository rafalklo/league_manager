require 'bundler/setup'
Bundler.setup

#require "codeclimate-test-reporter"
# ENV['CODECLIMATE_REPO_TOKEN'] = "203e7217f95eb57beb64e1c1fd42ac3a379c0f388561387221f0af9799d249f4"
#CodeClimate::TestReporter.start

require 'league_manager'
require 'awesome_print'
require 'vcr'
require 'zlib'
require 'stringio'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.ignore_hosts 'codeclimate.com'
  
  # Decompress gzipped responses when replaying cassettes
  # VCR stores gzipped responses as binary data, but RestClient expects
  # decompressed JSON when reading from cassettes. This hook decompresses
  # gzipped response bodies during playback.
  config.before_playback do |interaction|
    response = interaction.response
    content_encoding = response.headers['Content-Encoding']
    
    # Check if response is gzipped (handle both string and array header values)
    is_gzipped = content_encoding && (
      Array(content_encoding).any? { |v| v.to_s.include?('gzip') } ||
      content_encoding.to_s.include?('gzip')
    )
    
    if is_gzipped
      body = response.body
      if body && (body.encoding == Encoding::ASCII_8BIT || body.encoding == Encoding::BINARY)
        begin
          # Decompress gzip (VCR already decoded base64 from YAML)
          io = StringIO.new(body)
          gz = Zlib::GzipReader.new(io)
          decompressed = gz.read
          gz.close
          
          # Update the response body and remove Content-Encoding header
          response.body = decompressed
          response.headers.delete('Content-Encoding')
        rescue => e
          # If decompression fails, leave it as-is
          # This might happen if the body isn't actually gzipped
        end
      end
    end
  end
end

RSpec.configure do |config|
  # some (optional) config here

end