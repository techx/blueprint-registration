class AcceptanceAgain < ActiveRecord::Migration
  def change
    add_column :hackers, :attending_day1, :boolean
  end
end
