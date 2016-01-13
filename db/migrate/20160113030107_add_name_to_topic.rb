class AddNameToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :name, :text
  end
end
