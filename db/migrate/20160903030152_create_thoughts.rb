class CreateThoughts < ActiveRecord::Migration[5.0]
  def change
    create_table :thoughts do |t|
      t.text :idea
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :thoughts, [:user_id, :created_at]
  end
end
