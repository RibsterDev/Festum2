class Event < ApplicationRecord
  has_many :event_users
  geocoded_by :address, latitude: :lat, longitude: :long
  after_validation :geocode, if: :will_save_change_to_address?
end
