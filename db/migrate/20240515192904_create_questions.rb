class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.belongs_to :ingredient, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
