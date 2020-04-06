require 'csv'


namespace :import_csv do

  desc "CSVデータをインポートするタスク"


  task questions: :environment do

    path = File.join Rails.root, "db/csv_data/csv_data.csv"

    list = []

    CSV.foreach(path, headers: true) do |row|
      list << {
          title: row["title"],
          body: row["body"],
        }
    end
    puts "インポート処理を開始"

    begin
      Question.create!(list)
      puts "インポート完了!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗：UnknownAttributeError"
    end
  end
end
