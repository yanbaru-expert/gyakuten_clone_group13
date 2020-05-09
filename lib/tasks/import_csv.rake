require 'csv'


namespace :import_csv do

  desc "動画教材のCSVデータをインポートするタスク"
  task movies: :environment do
    path = File.join Rails.root, "db/csv_data/movie_data.csv"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
        title: row["title"],
        url: row["url"]
      }
    end
    puts "インポート処理開始"
    begin
      Movie.create!(list)
      puts "インポート完了"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗しました:UnknownAttributeError"
    end
  end

  desc "RailsテキストのCSVデータをインポートするタスク"
  task rails_texts: :environment do
    path = File.join Rails.root, "db/csv_data/rails_text_data.csv"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
        genre: row["genre"],
        title: row["title"],
        content: row["content"]
      }
    end
    puts "インポート処理を開始"
    begin
      RailsText.create!(list)
      puts "インポート完了!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗：UnknownAttributeError"
    end
  end


  desc "AWS教材のCSVデータをインポートするタスク"
  task aws_texts: :environment do
    path = File.join Rails.root, "db/csv_data/aws_text_data.csv"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
        title: row["title"],
        content: row["content"]
      }
    end
    puts "インポート処理開始"
    begin
      AwsText.create!(list)
      puts "インポート完了"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗しました:UnknownAttributeError"
    end
  end


  desc "質問集のCSVデータをインポートするタスク"
  task questions: :environment do
    path = File.join Rails.root, "db/csv_data/question_data.csv"
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


  desc "LINE@のCSVデータをインポートするタスク"
  task line_texts: :environment do
    path = File.join Rails.root, "db/csv_data/line_text_data.csv"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
        genre: row["genre"],
        title: row["title"],
        content: row["content"]
      }
    end
    puts "インポート処理開始"
    begin
      LineText.create!(list)
      puts "インポート完了"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗しました:UnknownAttributeError"
    end
  end
end
