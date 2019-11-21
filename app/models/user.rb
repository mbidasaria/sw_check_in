class User < ApplicationRecord
  # Direct associations

  has_many   :flights,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :phone_number, :presence => true

end
