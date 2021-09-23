# == Schema Information
#
# Table name: sdps
#
#  id        :bigint           not null, primary key
#  handle    :bigint
#  offer     :boolean
#  remote    :boolean
#  sdp       :string
#  session   :bigint
#  timestamp :datetime
#
class Sdp < ApplicationRecord
end
