namespace :import do
  desc 'Imports olympians data from csv file'

  require 'csv'

  task olympians: :environment do
    CSV.foreach('../data/data.csv', headers: true) do |row|
      puts(row)
    end
  end
end