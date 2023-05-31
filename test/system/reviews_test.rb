require "application_system_test_case"

class ReviewsTest < ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @editor = users(:editor)
    @manager = users(:manager)
  end

  test 'creating a power gauge, measurement, and review' do
    # Step 1: Editor logs in and creates a power gauge
    sign_in @editor
    visit new_gauge_path
    fill_in 'Name', with: 'Test Gauge'
    fill_in 'Start date', with: '2023-01-01'
    fill_in 'End date', with: '2023-12-31'
    fill_in 'Unit', with: 'kWh'
    select 'weeks', from: 'Time unit' 
    click_on 'Create Gauge'
    
    power_gauge = PowerGauge.find_by(name: 'Test Gauge')
    assert_not_nil power_gauge

    # Step 2: Editor creates a measurement for the power gauge
    visit new_gauge_measurement_path(power_gauge)
    fill_in 'measurement_amount', with: '2500.0'
    click_on 'Create Measurement'

    measurement = Measurement.find_by(amount: 2500.0)
    assert_not_nil measurement

    # Step 3: Editor logs out
    sign_out @editor

    # Step 4: Manager signs in
    sign_in @manager

    # Step 5: Manager creates a review for the measurement
    visit new_gauge_measurement_review_path(power_gauge, measurement)
    select 'Approved', from: 'Status'
    click_on 'Create Review'

    review = Review.find_by(status: 'Approved')
    assert_not_nil review
  end


end