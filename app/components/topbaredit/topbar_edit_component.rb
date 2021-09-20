# frozen_string_literal: true

class Topbaredit::TopbarEditComponent < ViewComponent::Base # rubocop:todo Style/Documentation
  def initialize(title:) # rubocop:todo Lint/MissingSuper
    @title = title
  end

  def title_bar
    @title
  end
end
