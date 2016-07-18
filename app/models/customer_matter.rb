class CustomerMatter < ActiveRecord::Base
  belongs_to :order
  belongs_to :matter
  validates :cantidad, presence: true
  validates :cantidad, numericality: { only_integer: true }

  include CantidadConcern

end
