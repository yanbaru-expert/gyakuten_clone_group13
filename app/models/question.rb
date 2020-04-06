class Question < ApplicationRecord

  def self.import(path)
     CSV.foreach(path, headers: true) do |row|
       Question.create(
         title: row["title"],
         body: row["body"],
       )
     end
  end

end
