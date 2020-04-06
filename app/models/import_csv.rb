class ImportCsv < ApplicationRecord

  path = 'db/csv_data/question_data.csv'

  def self.import(path)
     CSV.foreach(path, headers: true) do |row|
       Question.create(
         title: row["title"],
         body: row["body"],
       )
     end
  end
end
