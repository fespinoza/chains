# frozen_string_literal: true
module Web
  module Controllers
    module Links
      # POST '/links' endpoint action
      class Create
        include Web::Action

        def call(params)
          link = LinkRepository.new.create(params[:link])
          self.status = 201
          self.body   = JSON.generate(link: link.to_h)
        end
      end
    end
  end
end
