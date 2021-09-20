class Menu::LinkMenuComponent < ViewComponent::Base
    def initialize(title:, icon:, badge:, link:)
      super
      @title = title 
      @icon  = icon
      @badge = badge
      @link  = link
      
    end

    def title_bar
      @title
    end

    def badge
      @badge
      #@obj.available_products.count
      
    end

    def icon_class
      case @icon
      when 'tasks'
        return('<svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
          viewBox="0 0 24 24" stroke="currentColor" class="h-6 w-6">
          <path d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"
         </svg>').html_safe
      when 'clients'
        return('<svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
          viewBox="0 0 24 24" stroke="currentColor" class="h-6 w-6">
          <path d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"
         </svg>').html_safe
      when 'book'
          return('<svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
            viewBox="0 0 24 24" stroke="currentColor" class="h-6 w-6">
            <path d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"
           </svg>').html_safe
      when 'product'
            return('<svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
              viewBox="0 0 24 24" stroke="currentColor" class="h-6 w-6">
              <path d="M19 20H5a2 2 0 01-2-2V6a2 2 0 012-2h10a2 2 0 012 2v1m2 13a2 2 0 01-2-2V7m2 13a2 2 0 002-2V9a2 2 0 00-2-2h-2m-4-3H9M7 16h6M7 8h6v4H7V8z"
             </svg>').html_safe
      when 'history'
          return('<svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
            viewBox="0 0 24 24" stroke="currentColor" class="h-6 w-6">
            <path d="M4 6h16M4 10h16M4 14h16M4 18h16"
           </svg>').html_safe
      when 'add_new'
        return('<svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
          viewBox="0 0 24 24" stroke="currentColor" class="h-6 w-6">
          <path d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"
         </svg>').html_safe
      else
        return('').html_safe
      end
    end


  end
