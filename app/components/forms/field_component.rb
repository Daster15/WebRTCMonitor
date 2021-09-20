# frozen_string_literal: true

class Forms::FieldComponent < ViewComponent::Base
  def initialize(name, form:, fieldheader:, fieldlabel:, type: 'text', css_class: [], **options)
    super
    @name = name
    @type = type
    @fieldheader = fieldheader
    @fieldlabel = fieldlabel
    @form = form
    @css_class = Array(css_class)
    @options = options.except(:form)
  end

  private

  def css_classes
    base_classes + @css_class
  end

  def base_classes
    %w[
      appearance-none
      block
      w-full
      bg-gray-200
      text-gray-700
      border
      border-gray-200
      rounded
      py-3
      px-4
      mb-3
      leading-tight
      focus:outline-none
      focus:bg-white
      focus:border-gray-500
    ]
  end
end
