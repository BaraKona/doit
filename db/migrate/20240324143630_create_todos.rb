class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.integer :priority
      t.integer :status

      t.timestamps
    end
  end
end
