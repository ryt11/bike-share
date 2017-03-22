class Trip < ActiveRecord::Base
  belongs_to :subscription_types
  
  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station_name, presence: true
  validates :end_date, presence: true
  validates :end_station_name, presence: true
  validates :bike_id, presence: true
  validates :subscription_type_id, presence: true
  validates :zip_code, presence: true

  def self.order_by_date
    Trip.order(:start_date).reverse
  end
end
