class Flight < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :departs_at, :presence => true

end
