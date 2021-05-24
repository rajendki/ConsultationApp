class AddMeetingWithUserFieldsToMeetings < ActiveRecord::Migration[6.1]
  def change
    add_column :meetings, :meeting_with_user, :string
  end
end
