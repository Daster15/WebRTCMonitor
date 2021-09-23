# == Schema Information
#
# Table name: plugins
#
#  id        :bigint           not null, primary key
#  call_type :string
#  callee    :string
#  event     :string
#  handle    :bigint
#  plugin    :string
#  session   :bigint
#  timestamp :datetime
#  username  :string
#  call_id   :string
#
class Plugin < ApplicationRecord
end
