class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :notes
      t.date :entry_date
      t.integer :user_id
    end
  end
end
