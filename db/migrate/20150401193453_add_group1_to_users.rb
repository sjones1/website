class AddGroup1ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :group1, :boolean, default: false
  end
end
