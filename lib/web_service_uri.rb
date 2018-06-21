require "web_service_uri/version"
require "uri"
require "pathname"

module WebServiceUri
  class WebServiceUri
    attr_reader :original_uri
    attr_reader :service_name

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
      @service_name = nil

      valid?
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

    def valid?
      @@services.keys.any? do |name|
        is_match = self.send "#{name}?"
        @service_name = name if is_match
        is_match
      end
    end

    def account_id
      return nil if @service_name.nil?

      split = @sns_uri.path
                  .chomp("/") # remove "/" at the end
                  .split("/")

      if @service_name == :linkedin
        split[2]
      else
        split[1]
      end
    end
  end
end
