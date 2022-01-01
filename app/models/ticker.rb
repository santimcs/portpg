class Ticker < ApplicationRecord

	has_one :stock, dependent: :destroy
	has_one :consensu, dependent: :destroy
	has_one :portfolio, dependent: :destroy

	has_many :epss, dependent: :destroy
	has_many :charts, dependent: :destroy	
	has_many :yr_profits, dependent: :destroy

	default_scope { order("name ASC") }

end
