class Orientation < ActiveRecord::Migration
  def change
    add_column :hackers, :orientation, :integer
  end
end
