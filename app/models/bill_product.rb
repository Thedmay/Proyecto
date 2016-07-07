class BillProduct < ActiveRecord::Base
  belongs_to :bill
  belongs_to :product

  include CantidadConcern
  
end
