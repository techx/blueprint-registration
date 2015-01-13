class AddQuestionResponseFields < ActiveRecord::Migration
  def change
    add_column :hackers, :experience, :text
    add_column :hackers, :desire, :text
  end
end
