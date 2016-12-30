# frozen_string_literal: true
module Web
  module Controllers
    module Links
      # GET '/links' endpoint action
      class Index
        include Web::Action

        def repository
          @repository = LinkRepository.new
        end

        def serializable_links
          repository.all.map(&:to_h)
        end

        def call(_params)
          self.body = JSON.generate(links: serializable_links)
        end
      end
    end
  end
end
