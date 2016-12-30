# frozen_string_literal: true
require 'spec_helper'

class LinksAPITests < Minitest::Test
  include Rack::Test::Methods

  def app
    Hanami.app
  end

  def json_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  module POSTLinksTests
    def test_saving_a_new_link
      sample_link = { url: 'http://hanamirb.org/#install' }

      post '/links', link: sample_link

      response  = last_response
      json_body = json_response(response)

      response.status.must_equal 201
      json_body[:link][:url].must_equal sample_link[:url]
      assert json_body[:link][:id]
    end
  end

  module GETLinksTests
    def test_fetching_saved_links
      get '/links'

      last_response.must_be :ok?
      last_response.body.must_equal(JSON.generate(links: []))
    end
  end

  include POSTLinksTests
  include GETLinksTests
end
