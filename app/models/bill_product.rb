class BillProduct < ActiveRecord::Base
  belongs_to :bill
  belongs_to :product
  validates :cantidad, presence: true
  validates :cantidad, numericality: { only_integer: true }

  include CantidadConcern
  
end
