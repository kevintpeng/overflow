class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :contents
      t.timestamps null: false
    end
  end
end
