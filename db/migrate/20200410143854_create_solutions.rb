class CreateSolutions < ActiveRecord::Migration[6.0]
  def change
    create_table :solutions do |t|
      t.references :question
      t.text :answer, null: false

      t.timestamps
    end
  end
end
