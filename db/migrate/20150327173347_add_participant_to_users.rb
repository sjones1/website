class AddParticipantToUsers < ActiveRecord::Migration
  def change
    add_column :users, :participant, :boolean, default: false
  end
end
