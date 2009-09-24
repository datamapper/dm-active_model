module DataMapper
  module ActiveModel

    # This is mostly copied from active_model and adapted to use extlib under the hood.
    # see http://github.com/rails/rails/blob/master/activemodel/lib/active_model/naming.rb
    class Name < String

      attr_reader :singular, :plural, :element, :collection, :partial_path, :human
      alias_method :cache_key, :collection

      def initialize(name)
        super
        @singular     = Extlib::Inflection.underscore(self).tr('/', '_').freeze
        @plural       = Extlib::Inflection.pluralize(@singular).freeze
        @element      = Extlib::Inflection.underscore(Extlib::Inflection.demodulize(self)).freeze
        @human        = @element.gsub(/_/, " ")
        @collection   = Extlib::Inflection.pluralize(Extlib::Inflection.underscore(self)).freeze
        @partial_path = "#{@collection}/#{@element}".freeze
      end

    end

    module ClassMethods

      # Returns an ActiveModel::Name object for module. It can be
      # used to retrieve all kinds of naming-related information.
      def model_name
        @_model_name ||= DataMapper::ActiveModel::Name.new(name)
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
