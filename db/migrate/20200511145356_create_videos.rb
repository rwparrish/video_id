class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :notes
      t.datetime :entry_date
      t.integer :user_id
    end
  end
end
