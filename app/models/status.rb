class Status < ApplicationRecord
  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

  validates :body, :presence => true

  validates :body, :length => { :maximum => 140 }

end
