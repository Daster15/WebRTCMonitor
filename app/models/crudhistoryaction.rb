# == Schema Information
#
# Table name: crudhistoryactions
#
#  id         :bigint           not null, primary key
#  action     :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Crudhistoryaction < ApplicationRecord

    scope :history, ->{ 
        joins("LEFT JOIN users ON  user_id = users.id")
        .select("crudhistoryactions.id, 
                 crudhistoryactions.action, 
                 crudhistoryactions.content, 
                 crudhistoryactions.created_at, 
                 users.email")
        .limit(5).order("created_at DESC")
      }
      
end
