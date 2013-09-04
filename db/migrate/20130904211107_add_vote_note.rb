class AddVoteNote < ActiveRecord::Migration
  def up
    add_column :votes, :note, :string
  end

  def down
    remove_column :votes, :note
  end
end
