class AddIndexToEventHashtag < ActiveRecord::Migration
  def change
    add_index :events, :hashtag, unique: true
  end
end
