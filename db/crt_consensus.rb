require 'csv'

class CreateConsensus < ActiveRecord::Base
  records_ins = 0
  records_upd = 0
  
  CSV.foreach(Rails.root.join("db/consensus.csv"), col_sep: ',', headers: true) do |row|
    ticker = Ticker.find_by_name(row[0])
    
    if ticker
      consensus = Consensu.where(name: row[0])
      consensu = consensus.first
      
      if consensu
        # Update existing record with new structure
        consensu.target = row[1]
        consensu.max = row[2]
        consensu.min = row[3]
        consensu.buy = row[4]
        consensu.hold = row[5]
        consensu.sell = row[6]
        consensu.save
        records_upd += 1   
      else
        # Create new record with new structure
        Consensu.find_or_create_by(
          name: row[0], 
          target: row[1],
          max: row[2],
          min: row[3],
          buy: row[4],
          hold: row[5],
          sell: row[6],
          ticker_id: ticker.id
        )
        records_ins += 1
        printf "%10s \n", row[0]
      end
    end
  end
  
  printf "%3d records added, %3d records updated.", records_ins, records_upd
end