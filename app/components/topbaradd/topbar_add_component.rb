# frozen_string_literal: true

class Topbaradd::TopbarAddComponent < ViewComponent::Base # rubocop:todo Style/Documentation
  def initialize(title:, link:) # rubocop:todo Lint/MissingSuper
    @title = title
    @link = link
  end

  def display_add_link
    link_to 'New', send("new_#{@link}_path"), :class =>"bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
  end

  def title_bar
    @title
  end
end
