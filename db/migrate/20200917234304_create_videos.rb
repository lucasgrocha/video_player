class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :name
      t.string :description
      t.string :views
      t.string :file

      t.timestamps
    end
  end
end
