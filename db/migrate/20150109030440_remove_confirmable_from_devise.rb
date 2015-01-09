class RemoveConfirmableFromDevise < ActiveRecord::Migration
  def change
    remove_index :hackers, :confirmation_token
    remove_column :hackers, :confirmation_token
    remove_column :hackers, :confirmed_at
    remove_column :hackers, :confirmation_sent_at
    remove_column :hackers, :unconfirmed_email
  end
end
