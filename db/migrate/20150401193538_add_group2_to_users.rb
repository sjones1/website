class AddGroup2ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :group2, :boolean, default: false
  end
end
