class AddGender < ActiveRecord::Migration
  def change
    add_column :hackers, :gender, :string
  end
end
