class CustomerMatter < ActiveRecord::Base
  belongs_to :Customer
  belongs_to :Matter
end
