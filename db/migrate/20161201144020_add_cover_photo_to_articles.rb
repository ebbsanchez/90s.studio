class AddCoverPhotoToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :cover_photo, :text
  end
end
