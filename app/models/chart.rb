class Chart < ApplicationRecord
	belongs_to :ticker
    default_scope { order(name: 'asc') }	
	before_save :assign_names
	before_validation :strip_whitespace

  	YEAR = [
			"2026",    		
			"2025",  		
			"2024",
			"2023",
			"2022",
			"2021",
			"2020",
			"2019",
      		"2018",
   			"2017",
			"2015"
        	]

  	QUARTER = [	  
			"4",
			"3",
			"2",
			"1"
    ]

private

	def assign_names
		ticker = Ticker.find(self.ticker_id)
		self.name = ticker.name
  	end

  	def strip_whitespace
  		self.image_q = image_q.strip if image_q.present?
  		self.image_y = image_y.strip if image_y.present?
	end


end
