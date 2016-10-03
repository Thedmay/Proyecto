class OrderProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  validates :cantidad, presence: true
  validates :cantidad, numericality: { only_integer: true }
  validates_numericality_of :cantidad,less_than_or_equal_to:9999999,
                            :message => "Parece ser muy grande"
  include CantidadConcern
end
