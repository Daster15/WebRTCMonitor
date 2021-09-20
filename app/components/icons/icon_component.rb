class Icons::IconComponent < ViewComponent::Base

    def initialize(icon:)
        @icon  = icon
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
        
        when 'settings'
            return('<svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
              viewBox="0 0 24 24" stroke="currentColor" class="h-6 w-6">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4"
             </svg>').html_safe
        when 'logout'
              return('<svg fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                viewBox="0 0 24 24" stroke="currentColor" class="h-6 w-6">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"
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
