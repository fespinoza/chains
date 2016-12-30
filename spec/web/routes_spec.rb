# frozen_string_literal: true
require 'spec_helper'

describe Web.routes do
  it 'recognizes "POST /links' do
    env   = Rack::MockRequest.env_for('/links', method: 'POST')
    route = Web.routes.recognize(env)

    expect(route).must_be :routable?
    expect(route.path).must_equal '/links'
  end

  it 'recognizes "GET /links"' do
    env   = Rack::MockRequest.env_for('/links', method: 'GET')
    route = Web.routes.recognize(env)

    expect(route).must_be :routable?
    expect(route.path).must_equal '/links'
  end
end
