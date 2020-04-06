class CreateAwsTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :aws_texts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
