# frozen_string_literal: true

require_relative "clinic_searcher/version"
require "httparty"
require "geocoder"

module ClinicSearcher
  class Error < StandardError
    def message
      "Please set up the environment variables for API_ENDPOINT and API_AUTH_TOKEN." \
        " Additionally, you may configure a RATIO_DISTANCE variable to specify the search radius."
    end
  end

  class << self
    def search(zipcode, distance = ratio_distance)
      raise Error.new.message if missing_required_env_variables?

      response = HTTParty.get(
        api_endpoint,
        headers: {"X-Auth-Token" => auth_token},
        query: {zipcode:, distance:}
      )
      response.parsed_response
    end

    private

    def api_endpoint
      ENV.fetch("API_ENDPOINT", nil)
    end

    def auth_token
      ENV.fetch("API_AUTH_TOKEN", nil)
    end

    def ratio_distance
      ENV.fetch("RATIO_DISTANCE", 20)
    end

    def missing_required_env_variables?
      # Check if the required environment variables are set, return true if they are missing
      ENV["API_ENDPOINT"].nil? || ENV["API_AUTH_TOKEN"].nil?
    end
  end
end
