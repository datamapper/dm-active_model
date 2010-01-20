require 'active_model/naming'

module DataMapper
  module ActiveModel

    module ClassMethods

      # Returns an ActiveModel::Name object for module. It can be
      # used to retrieve all kinds of naming-related information.
      def model_name
        @_model_name ||= ::ActiveModel::Name.new(self)
      end

    end

    module InstanceMethods

      def self.included(host)
        host.class_eval do
          alias :new_record? :new?
        end
      end

      def to_model
        self
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

  Model.append_extensions(ActiveModel::ClassMethods)
  Model.append_inclusions(ActiveModel::InstanceMethods)

end
