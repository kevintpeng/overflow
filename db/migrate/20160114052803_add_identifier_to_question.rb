class AddIdentifierToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :identifier, :text
  end
end
