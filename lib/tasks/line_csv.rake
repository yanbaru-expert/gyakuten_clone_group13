namespace :line_csv do

  desc "csvファイルのデータをline_textsテーブルにインポートする"
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
