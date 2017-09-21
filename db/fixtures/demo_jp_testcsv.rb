require 'csv'

csv_options = { headers: :first_row }
filepath = 'db/fixtures/Ringi.co アカウントリスト デモチーム様 - アカウントリスト.csv'
team_id = 10

csv = CSV.read(filepath, csv_options)
csv.each do |row|
  last_name = row[0]
  first_name = row[1]
  email = row[2]
  password = row[3]

  User.seed do |s|
    s.last_name = last_name
    s.first_name = first_name
    s.email = email
    s.password = password
    s.team_id = team_id
  end
end
