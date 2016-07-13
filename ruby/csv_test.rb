require 'csv'

csv_data = CSV.read('testdata.csv', headers: true)
csv_data.each do |row|
  puts(row['id']+ ': '+row['text'] + '(' + row['comment'] + ')')
end
