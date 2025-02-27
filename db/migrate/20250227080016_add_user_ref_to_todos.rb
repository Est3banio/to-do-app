class AddUserRefToTodos < ActiveRecord::Migration[8.0]
  def up
    # First add the reference allowing null values
    add_reference :todos, :user, null: true, foreign_key: true
    
    # Create a default user for existing todos
    default_user = User.create!(
      email: 'default@example.com',
      password: 'password123',
      name: 'Default User'
    )
    
    # Assign the default user to existing todos
    Todo.update_all(user_id: default_user.id)
    
    # Now make the column non-nullable
    change_column_null :todos, :user_id, false
  end
  
  def down
    remove_reference :todos, :user, foreign_key: true
  end
end
