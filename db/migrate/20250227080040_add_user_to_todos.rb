class AddUserToTodos < ActiveRecord::Migration[8.0]
  def up
    # Skip column creation since it already exists
    # Just ensure default user exists
    default_user = User.find_by(email: 'default@example.com')
    
    unless default_user
      default_user = User.create!(
        email: 'default@example.com',
        password: 'password123',
        name: 'Default User'
      )
    end
  end
  
  def down
    # No action needed for down
  end
end
