class CreateLineTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :line_texts do |t|
      t.string :title
      t.string :genre
      t.text :contents
      t.timestamps
    end
  end
end
