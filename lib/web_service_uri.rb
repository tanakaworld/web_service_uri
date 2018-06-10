require "web_service_uri/version"
require "uri"
require "pathname"

module WebServiceUri
  class WebServiceUri
    attr_reader :original_uri

    def self.available_services
      [:github, :twitter, :facebook, :linkedin, :instagram]
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

    def github?
      @sns_uri.host.include? 'github.com'
    end

    def twitter?
      @sns_uri.host.include? 'twitter.com'
    end

    def facebook?
      @sns_uri.host.include? 'facebook.com'
    end

    def linkedin?
      @sns_uri.host.include? 'linkedin.com'
    end

    def instagram?
      @sns_uri.host.include? 'instagram.com'
    end
  end
end
