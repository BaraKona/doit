class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.integer :priority
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
