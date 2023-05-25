class Review < ApplicationRecord
    belongs_to :user
    belongs_to :measurement
    
    validates :status, presence: true, inclusion: { in: ['Pending', 'Approved', 'Rejected'] }
end