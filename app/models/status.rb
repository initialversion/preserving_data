class Status < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :body, :length => { :maximum => 140 }

end
