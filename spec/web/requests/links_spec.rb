# frozen_string_literal: true
require 'spec_helper'

class LinksAPITests < Minitest::Test
  include Rack::Test::Methods

  def setup
    clear_links
  end

  def app
    Hanami.app
  end

  def json_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def clear_links
    LinkRepository.new.clear
  end

  def create_link(params = {})
    @link_repository ||= LinkRepository.new
    @link_repository.create(params)
  end

  module POSTLinksTests
    def test_saving_a_new_link
      sample_link = { url: 'http://hanamirb.org/#install' }

      response = post '/links', link: sample_link
      json_body = json_response(response)

      assert_equal response.status, 201
      assert_equal json_body[:link][:url], sample_link[:url]
      assert json_body[:link][:id]
    end
  end

  module GETLinksTests
    def test_fetching_saved_links
      urls = [
        'http://hanamirb.org/guides/models/entities/',
        'https://github.com/hanami/model'
      ]
      urls.each { |url| create_link(url: url) }

      response = get '/links'
      json_body = json_response(response)

      assert_equal response.status, 200
      assert_equal json_body[:links].map { |link| link[:url] }, urls
    end
  end

  include POSTLinksTests
  include GETLinksTests
end
