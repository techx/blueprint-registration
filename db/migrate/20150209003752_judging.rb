class Judging < ActiveRecord::Migration
  def change
    add_column :hackers, :judging, :boolean, default: false
  end
end
