class Matter < ActiveRecord::Base
	has_many :matter_products
	has_many :products, through: :matter_products
end
