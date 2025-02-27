class Category < ApplicationRecord
  has_and_belongs_to_many :todos
  
  validates :name, presence: true, uniqueness: true
  validates :color, presence: true

  before_validation :set_default_color
  
  private
  
  def set_default_color
    self.color ||= generate_random_color
  end
  
  def generate_random_color
    colors = %w[red-500 blue-500 green-500 yellow-500 purple-500 pink-500 indigo-500 teal-500 orange-500]
    colors.sample
  end
end
