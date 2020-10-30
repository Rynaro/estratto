module Estratto
  module Helpers
    class Hash
      # support methods for deep transforming nested hashes and arrays
      def self.deep_transform_keys(object, &block)
        case object.class.name
        when 'Hash'
          object.each_with_object({}) do |(key, value), result|
            result[yield(key)] = deep_transform_keys(value, &block)
          end
        when 'Array'
          object.map { |e| deep_transform_keys(e, &block) }
        else
          object
        end
      end
    end
  end
end
