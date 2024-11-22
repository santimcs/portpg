class Chart < ApplicationRecord
	belongs_to :ticker
    default_scope { order(name: 'asc') }	
	before_save :assign_names

  	YEAR = [
			"2024",
			"2023",
			"2022",
			"2021",
			"2020",
			"2019",
      "2018",
      "2017",
			"2016",
			"2015",
			"2014",
			"2013"
        	]

  	QUARTER = [	  
			"3",
			"2",    		
			"1",     
			"4"
    ]

private

	def assign_names
		ticker = Ticker.find(self.ticker_id)
		self.name = ticker.name
  	end

end
