class PowerGauge < ApplicationRecord
    belongs_to :user
    has_many   :measurements, dependent: :destroy

    validates :name, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :unit, presence: true
    validates :time_unit, presence: true, inclusion: { in: ['days', 'weeks', 'months', 'years'] }
end