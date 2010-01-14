require 'extlib/inflection'

module ActiveSupport
  Inflector = Extlib::Inflection
end

module ActiveModel

  # This is mostly copied from active_model and adapted to use extlib under the hood.
  # see http://github.com/rails/rails/blob/master/activemodel/lib/active_model/naming.rb
  class Name < String

    attr_reader :singular, :plural, :element, :collection, :partial_path, :human
    alias_method :cache_key, :collection

    def initialize(klass)
      super(klass.name)
      @singular     = Extlib::Inflection.underscore(self).tr('/', '_').freeze
      @plural       = Extlib::Inflection.pluralize(@singular).freeze
      @element      = Extlib::Inflection.underscore(Extlib::Inflection.demodulize(self)).freeze
      @human        = Extlib::Inflection.humanize(@element)
      @collection   = Extlib::Inflection.pluralize(Extlib::Inflection.underscore(self)).freeze
      @partial_path = "#{@collection}/#{@element}".freeze
    end

  end

end
