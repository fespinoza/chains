# frozen_string_literal: true

process_link = lambda do |_env|
  data = {
    link: {
      id: 2,
      url: 'http://hanamirb.org/#install',
      tags: ['ruby', 'web-framework'],
      created_at: '',
      updated_at: ''
    }
  }
  json_body = JSON.generate(data)
  [201, { content_type: 'application/json' }, json_body]
end

return_links = lambda do |_env|
  [200, {}, JSON.generate(links: [])]
end

post '/links', to: process_link
get '/links', to: return_links
