require "spec_helper"

RSpec.describe WebServiceUri do
  before do
    @username = 'username'
    @service_uris = {
        github: "https://github.com/#{@username}",
        twitter: "https://twitter.com/#{@username}",
        facebook: "https://www.facebook.com/#{@username}",
        linkedin: "https://www.linkedin.com/in/#{@username}",
        instagram: "https://www.instagram.com/#{@username}"
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
      expect(ws_uri.original_uri).to eql("https://github.com/#{@username}")
    end
  end

  describe "#path" do
    it "able to get path string" do
      ws_uri = WebServiceUri::WebServiceUri.new @service_uris[:github]
      expect(ws_uri.path).to eql(@username)
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
      let(:ws_uri) {WebServiceUri::WebServiceUri.new "https://github.com/#{@username}"}

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

  describe "#account_id" do
    context "when is expected format" do
      it "responds account id" do
        @service_uris.each do |name, uri|
          ws_uri = WebServiceUri::WebServiceUri.new uri
          expect(ws_uri.account_id).to eql(@username)
        end
      end
    end

    context "when is expected format(has / at last)" do
      it "responds account id" do
        [
            "https://github.com/#{@username}/",
            "https://twitter.com/#{@username}/",
            "https://www.facebook.com/#{@username}/",
            "https://www.linkedin.com/in/#{@username}/",
            "https://www.instagram.com/#{@username}/"
        ].each do |uri|
          ws_uri = WebServiceUri::WebServiceUri.new uri
          expect(ws_uri.account_id).to eql(@username)
        end
      end
    end

    context "when is expected format(has extra params)" do
      it "responds account id" do
        [
            "https://github.com/#{@username}/aaaaa?p=1",
            "https://twitter.com/#{@username}/aaaaa?p=1",
            "https://www.facebook.com/#{@username}/aaaaa?p=1",
            "https://www.linkedin.com/in/#{@username}/aaaaa?p=1",
            "https://www.instagram.com/#{@username}/aaaaa?p=1"
        ].each do |uri|
          ws_uri = WebServiceUri::WebServiceUri.new uri
          expect(ws_uri.account_id).to eql(@username)
        end
      end
    end

    context "when is unexpected uri" do
      it "respond nil" do
        ws_uri = WebServiceUri::WebServiceUri.new @not_service_uri
        expect(ws_uri.account_id).to be_nil
      end
    end
  end
end
