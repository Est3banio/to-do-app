class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :todos, dependent: :destroy
  
  validates :name, presence: true
  
  def initials
    name.split.map(&:first).join.upcase if name.present?
  end
end
