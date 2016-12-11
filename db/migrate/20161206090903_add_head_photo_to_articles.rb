class AddHeadPhotoToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :head_photo, :text
  end
end
