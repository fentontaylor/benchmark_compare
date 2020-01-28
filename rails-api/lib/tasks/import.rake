namespace :import do
  desc 'Imports olympians data from csv file'

  require 'csv'

  task data: :environment do
    ActiveRecord::Base.connection.execute(
      "TRUNCATE TABLE olympians RESTART IDENTITY;"
    )
    CSV.foreach('../data/data.csv', headers: true) do |row|
      row = row.to_h
      olympian = Olympian.find_or_create_by(
        name:   row['name'],
        sex:    row['sex'],
        age:    row['age'],
        height: row['height'],
        weight: row['weight'],
      )
      puts "Processing: <Olympian: name='#{olympian.name}', sex='#{olympian.sex}'...>"
    end
  end
end