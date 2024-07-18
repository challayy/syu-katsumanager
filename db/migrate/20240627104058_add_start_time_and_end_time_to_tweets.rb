class AddStartTimeAndEndTimeToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :start_time, :datetime
    add_column :tweets, :end_time, :datetime
  end
end
