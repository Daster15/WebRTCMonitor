# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  author     :string
#  category   :string
#  name       :string
#  price      :decimal(3, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Book < ApplicationRecord
    self.inheritance_column = "no_sti"

    has_one_attached :book_image

    def self.search(search)
        if search 
            where(["name LIKE ?","%#{search}%"])
        else
            all
        end
    end 
end
