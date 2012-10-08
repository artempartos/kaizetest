class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :description
      t.string :state
      t.datetime :deadline
      t.integer :performer_id

      t.timestamps
    end
  end
end
