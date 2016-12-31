# frozen_string_literal: true
module Web
  module Controllers
    module Links
      # POST '/links' endpoint action
      class Create
        include Web::Action
        accept :json

        def call(params)
          link = LinkRepository.new.create(params[:link])
          self.status = 201
          self.body   = MultiJson.dump(link: link.to_h)
        rescue Hanami::Model::Error => error
          handle_validation_error(error)
        end

        private

        def handle_validation_error(exception)
          self.status = 422
          self.body = MultiJson.dump(error: { message: exception.message })
        end
      end
    end
  end
end
