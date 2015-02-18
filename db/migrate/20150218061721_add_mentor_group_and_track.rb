class AddMentorGroupAndTrack < ActiveRecord::Migration
  def change
    add_column :hackers, :track_name, :string
    add_column :hackers, :mentor_group, :string
  end
end
