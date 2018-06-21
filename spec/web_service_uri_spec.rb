require "spec_helper"

RSpec.describe WebServiceUri do
  before do
    @service_uris = {
        github: "https://github.com/tanakaworld",
        twitter: "https://twitter.com/_tanakaworld",
        facebook: "https://www.facebook.com/tanaka.world",
        linkedin: "https://www.linkedin.com/in/yutaro-tanaka-world-7863b249",
        instagram: "https://www.instagram.com/_tanakaworld/"
    }
    @available_services = @service_uris.keys
    @not_service_uri = "https://example.com/example"
  end

  it "has a version number" do
    expect(WebServiceUri::VERSION).not_to be nil
  end

  describe ".available_services" do
    it 'matched to expected' do
      expect(WebServiceUri::WebServiceUri.available_services).to eql(@available_services)
    end
  end

  describe "#original_uri" do
    it "equal to original_uri input uri" do
      ws_uri = WebServiceUri::WebServiceUri.new @service_uris[:github]
      expect(ws_uri.original_uri).to eql("https://github.com/tanakaworld")
    end
  end

  describe "#path" do
    it "able to get path string" do
      ws_uri = WebServiceUri::WebServiceUri.new @service_uris[:github]
      expect(ws_uri.path).to eql("tanakaworld")
    end
  end

  describe "check #service_name?" do
    context "when is service uri" do
      it "responds true" do
        @available_services.each do |service_name|
          ws_uri = WebServiceUri::WebServiceUri.new @service_uris[service_name]
          service_method_name = "#{service_name}?"
          expect(ws_uri.send(service_method_name)).to eql(true)
        end
      end
    end

    context "when is not service uri" do
      it "response false" do
        @available_services.each do |service_name|
          ws_uri = WebServiceUri::WebServiceUri.new @not_service_uri
          service_method_name = "#{service_name}?"
          expect(ws_uri.send(service_method_name)).to eql(false)
        end
      end
    end
  end

  describe "#valid?" do
    context "when is expected service uri" do
      let(:ws_uri) {WebServiceUri::WebServiceUri.new "https://github.com/tanakaworld"}

      it "responds true" do
        expect(ws_uri.valid?).to eql(true)
      end
      it "service_name is set" do
        expect(ws_uri.service_name).to eql(:github)
      end
    end

    context "when is unexpected uri" do
      let(:ws_uri) {WebServiceUri::WebServiceUri.new @not_service_uri}

      it "responds false" do
        expect(ws_uri.valid?).to eql(false)
      end
      it "service_name is not set" do
        expect(ws_uri.service_name).to be_nil
      end
    end
  end
end
