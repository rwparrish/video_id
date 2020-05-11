class CreateVideos < ActiveRecord::Migration
  def change
    create_table do |t|
      t.string :title
      t.string :notes
      t.datetime :datetime
    end
    
  end
end
