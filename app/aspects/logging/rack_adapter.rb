# frozen_string_literal: true

module Terminus
  module Aspects
    module Logging
      # Adapts Cogger Rack middleware for provider registration.
      module RackAdapter
        module_function

        def with logger
          @logger ||= logger
          self
        end

        def new application
          @application = Cogger::Rack::Logger.new application, {logger: @logger}
        end

        def call(environment) = @application.call environment

        def instrument(_event_id, payload = {})
          yield payload if block_given?
        end
      end
    end
  end
end
