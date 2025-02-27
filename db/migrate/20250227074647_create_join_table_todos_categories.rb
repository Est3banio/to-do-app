class CreateJoinTableTodosCategories < ActiveRecord::Migration[8.0]
  def change
    create_join_table :todos, :categories do |t|
      t.index [:todo_id, :category_id]
      t.index [:category_id, :todo_id]
    end
  end
end
