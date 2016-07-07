class CustomerMatter < ActiveRecord::Base
  belongs_to :order
  belongs_to :matter

  include CantidadConcern

end
