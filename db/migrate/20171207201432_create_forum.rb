class CreateForum < ActiveRecord::Migration[5.1]
  def change
    create_table :forums do |t|
      t.string :title
      t.string :author
      t.string :subject
      t.string :comment
      t.references :user, foreign_key: true
      t.references :reply, index: true, optional: true

      t.timestamp
  end
  end
  end
