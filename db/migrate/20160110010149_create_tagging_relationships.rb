class CreateTaggingRelationships < ActiveRecord::Migration
  def change
    create_table :tagging_relationships do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
