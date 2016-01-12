class AddTopicToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :topic, index: true, foreign_key: true
  end
end
