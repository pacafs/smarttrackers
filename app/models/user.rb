class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :power_gauges, dependent: :destroy
  has_many :reviews, dependent: :destroy
  
  validates :role, presence: true, inclusion: { in: ['Editor', 'Manager'] }

  def is_manager?
    self.role == "Manager"
  end

end