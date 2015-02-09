class AcceptanceForm < ActiveRecord::Migration
  def change
    add_column :hackers, :attending, :boolean
    add_column :hackers, :laptop_type, :integer
    add_column :hackers, :phone_type, :integer
    add_column :hackers, :first_choice, :integer
    add_column :hackers, :second_choice, :integer
    add_column :hackers, :third_choice, :integer
    add_column :hackers, :experience_level, :integer
    add_column :hackers, :have_forms, :boolean
  end
end
