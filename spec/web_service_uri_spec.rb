require "spec_helper"

RSpec.describe WebServiceUri do
  it "has a version number" do
    expect(WebServiceUri::VERSION).not_to be nil
  end
end
