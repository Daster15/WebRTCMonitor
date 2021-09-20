module ApplicationHelper
    include Pagy::Frontend

    def sortable(column, title = nil)
        title ||= column.titleize
        css_class = column == sort_column ? "current #{sort_direction}" : nil
        direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
        link_to title, {:sort => column, :direction => direction}, {:class =>  css_class}
    end

    def user_avatar(user, size=50)
        if user.avatar.attached?
           user.avatar.variant(resize: "#{size}x#{size}!")
        else
            #letter_avatar_url('ksz2k', 200)
            Avatarro.image(user.email[0..1].upcase, solid: true, color:"white")
        end
      end
end
