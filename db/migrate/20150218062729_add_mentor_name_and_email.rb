class AddMentorNameAndEmail < ActiveRecord::Migration
  def change
    add_column :hackers, :mentor_name, :string
    add_column :hackers, :mentor_email, :string
  end
end
