class AddDescriptionCol < ActiveRecord::Migration
  def change
  	add_column :projects, :description, :text
  end
end
