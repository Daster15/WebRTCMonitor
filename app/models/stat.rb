# == Schema Information
#
# Table name: stats
#
#  id           :bigint           not null, primary key
#  base         :integer
#  bytesrecv    :bigint
#  bytessent    :bigint
#  handle       :bigint
#  jitterlocal  :integer
#  jitterremote :integer
#  lostlocal    :integer
#  lostremote   :integer
#  lsr          :integer
#  medium       :string
#  nacksrecv    :bigint
#  nackssent    :bigint
#  packetsrecv  :integer
#  packetssent  :integer
#  session      :bigint
#  timestamp    :datetime
#
class Stat < ApplicationRecord
end
