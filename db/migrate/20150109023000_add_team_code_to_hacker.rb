class AddTeamCodeToHacker < ActiveRecord::Migration
  def change
    add_column :hackers, :team_code, :string
  end
end
