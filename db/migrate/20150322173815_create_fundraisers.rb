class CreateFundraisers < ActiveRecord::Migration
  def change
    create_table :fundraisers do |t|
      t.text :title
      t.text :content
      t.date :date

      t.timestamps null: false
    end
  end
end
