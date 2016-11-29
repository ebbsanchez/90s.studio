class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.text :title
      t.text :link
      t.text :description
      t.text :category

      t.timestamps null: false
    end
  end
end
