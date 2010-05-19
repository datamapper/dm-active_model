module ActiveModel
  module Lint
    module Tests
      module Validations

        VALIDATION_METHODS = %w[
          validate
          validates
          validates_each
          validates_with
          validates_acceptance_of
          validates_confirmation_of
          validates_exclusion_of
          validates_format_of
          validates_inclusion_of
          validates_length_of
          validates_numericality_of
          validates_presence_of
        ]

        VALIDATION_METHODS.each do |validation_method|
          define_method "test_#{validation_method}" do
            assert model.class.respond_to?(validation_method)
          end
        end

      end
    end
  end
end
