# frozen_string_literal: true

class Table::TrComponent < ViewComponent::Base # rubocop:todo Style/Documentation
  with_collection_parameter :item

  def initialize(item:, link:, columnname:) # rubocop:todo Lint/MissingSuper
    @item = item
    @link = link
    @columnname = columnname
  end

  def item_id
    @item.id
  end

  def edit_link
    link_to 'Edit', "#{@link}/#{@item.id}/edit",:class =>"bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
  end

  def inline 
    link_to 'Inline', "details_show?id=#{@item.id}", :class =>"bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
  end

  def hide
    link_to 'Hide', "details_hide?id=#{@item.id}", :class =>"bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
  end

  def remove_link
    button_to 'Delete', "#{@link}/#{@item.id}", :class =>"bg-transparent hover:bg-red-500 text-red-500 font-semibold hover:text-white py-2 px-4 border border-red-400 hover:border-transparent rounded" ,method: :delete, data: { confirm: 'Are you sure?' }
  end

  def show_link
    link_to 'Show', "#{@link}/#{@item.id}",:class =>"bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
  end


  def column_name
    @columnname = JSON.parse @columnname
  end

 

 
end
