class Measurement < ApplicationRecord
    belongs_to :power_gauge
    has_one    :review, dependent: :destroy
    validates  :amount, presence: true, numericality: true
end
