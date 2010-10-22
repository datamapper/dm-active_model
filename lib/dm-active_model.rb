require 'active_model/naming'

module DataMapper
  module ActiveModel

    module InstanceMethods

      def to_model
        self
      end

      def persisted?
        saved?
      end

      def to_key
        key
      end

      def to_param
        return nil if key.nil?
        if key.length > 1
          raise "You need to implement #to_param yourself to support this key: #{self.class.key.inspect}"
        else
          self.key.first.to_s
        end
      end

      # Define the minimum requirements if the resource
      # has no concept of validation baked in, which
      # happens if dm-validations is not required.
      unless respond_to?(:validatable?)

        def valid?
          true
        end

        def errors
          obj = Object.new
          def obj.[](key)         [] end
          def obj.full_messages() [] end
          obj
        end

      end

    end

  end

  Model.append_extensions(::ActiveModel::Naming)
  Model.append_inclusions(ActiveModel::InstanceMethods)

end
