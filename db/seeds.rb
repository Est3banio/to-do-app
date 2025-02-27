# Create default categories
categories = [
  { name: "Work", color: "blue-500" },
  { name: "Personal", color: "green-500" },
  { name: "Shopping", color: "yellow-500" },
  { name: "Urgent", color: "red-500" },
  { name: "Learning", color: "purple-500" }
]

categories.each do |category_attrs|
  Category.find_or_create_by!(name: category_attrs[:name]) do |category|
    category.color = category_attrs[:color]
  end
end

puts "Created #{categories.size} categories"

# Create some sample todos
todos = [
  { title: "Buy groceries", completed: false, category_names: ["Shopping"] },
  { title: "Finish project report", completed: false, category_names: ["Work", "Urgent"] },
  { title: "Call doctor for appointment", completed: false, category_names: ["Personal"] },
  { title: "Learn Ruby on Rails", completed: false, category_names: ["Learning"] },
  { title: "Pay bills", completed: true, category_names: ["Personal", "Urgent"] }
]

todos.each do |todo_attrs|
  category_names = todo_attrs.delete(:category_names)
  categories = Category.where(name: category_names)
  
  todo = Todo.find_or_create_by!(title: todo_attrs[:title]) do |t|
    t.completed = todo_attrs[:completed]
  end
  
  todo.categories = categories
  todo.save!
end

puts "Created sample todos"
