class AddIndexToFundraisersTitle < ActiveRecord::Migration
  def change
    add_index :fundraisers, :title, unique: true
  end
end
