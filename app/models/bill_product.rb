class BillProduct < ActiveRecord::Base
  belongs_to :Bill
  belongs_to :Product
end
