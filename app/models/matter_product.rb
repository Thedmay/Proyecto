class MatterProduct < ActiveRecord::Base
  belongs_to :matter
  belongs_to :product
end
