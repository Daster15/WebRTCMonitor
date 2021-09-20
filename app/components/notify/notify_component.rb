class Notify::NotifyComponent < ViewComponent::Base
    with_collection_parameter :item
  
    def initialize(item:, notice:)
      @item = item
      @notice = notice
    end
  end