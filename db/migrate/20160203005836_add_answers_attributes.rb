class AddAnswersAttributes < ActiveRecord::Migration
  def change
    add_column :answers, :explanation, :text
  end
end
