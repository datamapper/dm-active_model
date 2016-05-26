require 'dm-core'
require 'active_support/core_ext/module/delegation'  # needed by active_model/naming
require 'active_support/core_ext/module/remove_method' # needed for Module.remove_possible_method in active_model/naming.rb (active_model ~> 4.1)
require 'active_support/concern'                     # needed by active_model/conversion
require 'active_model/naming'
require 'active_model/conversion'

module DataMapper
  module ActiveModel

    module InstanceMethods
      include ::ActiveModel::Conversion

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
  Model.append_extensions(::ActiveModel::Conversion::ClassMethods)
  Model.append_inclusions(ActiveModel::InstanceMethods)

end
