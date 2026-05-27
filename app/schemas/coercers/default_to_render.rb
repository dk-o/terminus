# auto_register: false
# frozen_string_literal: true

require "refinements/hash"

module Terminus
  module Schemas
    # Coerces a key's value to "render" when key is missing or falsy.
    module Coercers
      using Refinements::Hash

      DefaultToRender = lambda do |key, result|
        return unless result.output

        attributes = Hash result.to_h
        attributes[key] = attributes[key] == "skip" ? "skip" : "render"

        attributes
      end
    end
  end
end
