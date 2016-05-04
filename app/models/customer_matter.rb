class CustomerMatter < ActiveRecord::Base
  belongs_to :customer
  belongs_to :matter
end
