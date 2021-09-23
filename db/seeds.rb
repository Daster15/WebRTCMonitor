
if Rails.env.development?
  AdminUser.create!(email: 'admin@admin.com', password: '123456', password_confirmation: '123456')
end
User.create!(email: 'test@test.com', password: '123456')

require 'csv'    

csv_text = File.read(Rails.root.join('lib/plugins_.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Plugin.create!(row.to_hash)
end

csv_text = File.read(Rails.root.join('lib/sdps_.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Sdp.create!(row.to_hash)
end

csv_text = File.read(Rails.root.join('lib/stats_.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Stat.create!(row.to_hash)
end


