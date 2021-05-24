class AddMeetingUserIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :meeting_user_id, :integer
  end
end
