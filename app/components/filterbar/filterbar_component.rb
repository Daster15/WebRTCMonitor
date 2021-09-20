class Filterbar::FilterbarComponent < ViewComponent::Base

    def initialize(search_value:)
        @search_value  = search_value
    end
    
    def nil_value
      if search_value.nil?
        return false
      else
        return true
      end

    end

    def search_output
      @search_value
    end
end
