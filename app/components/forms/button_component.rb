# frozen_string_literal: true

class Forms::ButtonComponent < ViewComponent::Base
  def initialize(text: nil, css_class: [], **options)
    super
    @text = text
    @css_class = Array(css_class)
    @options = options
  end

  private

  def css_classes
    base_classes + @css_class
  end

  def base_classes
    %w[
      bg-transparent
      hover:bg-blue-500
      text-blue-700
      font-semibold
      hover:text-white
      py-2
      px-4
      mb-3
      border
      border-blue-500
      hover:border-transparent
      rounded
    ]
  end
end
