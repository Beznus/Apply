class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :posting_id
      t.datetime :published
      t.string :link
      t.string :title
      t.text :content
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
