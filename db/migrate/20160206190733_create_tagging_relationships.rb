class CreateTaggingRelationships < ActiveRecord::Migration
  def change
    create_table :tagging_relationships do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
