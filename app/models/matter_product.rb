class MatterProduct < ActiveRecord::Base
  belongs_to :matter
  belongs_to :product
  validates :cantidad, presence: true
  validates :cantidad, numericality: { only_integer: true }

  include CantidadConcern
end
