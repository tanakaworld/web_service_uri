require "web_service_uri/version"
require "uri"
require "pathname"

module WebServiceUri
  class WebServiceUri
    attr_reader :original_uri

    @@services = {
        github: 'github.com',
        twitter: 'twitter.com',
        facebook: 'facebook.com',
        linkedin: 'linkedin.com',
        instagram: 'instagram.com'
    }
    @@services.each do |name, url|
      define_method "#{name}?" do
        @sns_uri.host.include? url
      end
    end

    def self.available_services
      @@services.keys
    end

    def initialize(original_uri)
      @original_uri = original_uri
      @sns_uri = URI.parse(original_uri)
    end

    def path
      if @sns_uri.path[0] === '/'
        copy = @sns_uri.path.dup
        copy.slice!(0)
        copy
      else
        @sns_uri.path
      end
    end
  end
end
