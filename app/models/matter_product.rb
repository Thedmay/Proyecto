class MatterProduct < ActiveRecord::Base
  belongs_to :Matter
  belongs_to :Product
end
