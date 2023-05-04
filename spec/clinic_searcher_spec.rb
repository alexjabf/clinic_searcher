# frozen_string_literal: true

require "spec_helper"
require "clinic_searcher"

RSpec.describe ClinicSearcher do
  let(:zipcode) { "12345" }
  let(:distance) { 10 }

  describe ".search" do
    context "when required environment variables are not set" do
      before do
        allow(ENV).to receive(:[]).with("API_ENDPOINT").and_return(nil)
        allow(ENV).to receive(:[]).with("AUTH_TOKEN").and_return(nil)
      end

      it "raises an error with an appropriate message" do
        error_message = ClinicSearcher::Error.new.message
        expect { described_class.search(zipcode, distance) }.to raise_error(error_message)
      end
    end

    context "when required environment variables are set" do
      before do
        allow(ENV).to receive(:[]).with("API_ENDPOINT").and_return("https://example.com/api")
        allow(ENV).to receive(:[]).with("AUTH_TOKEN").and_return("sample-auth-token")
        allow(HTTParty).to receive(:get).and_return(double("response", parsed_response: "OK"))
      end

      it "returns the parsed response" do
        expect(described_class.search(zipcode, distance)).to eq("OK")
      end
    end
  end
end
