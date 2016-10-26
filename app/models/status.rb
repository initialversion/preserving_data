class Status < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :body, :presence => true

  validates :body, :length => { :maximum => 140 }

end
