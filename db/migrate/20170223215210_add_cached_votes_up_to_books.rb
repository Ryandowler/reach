class AddCachedVotesUpToBooks < ActiveRecord::Migration
  def change
    add_column :books, :cached_votes_up, :integer, :default => 0
  end
end
