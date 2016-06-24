class Customer < ActiveRecord::Base
	has_many :bills
	has_many :orders
end
