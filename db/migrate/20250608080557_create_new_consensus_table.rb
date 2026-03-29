# db/migrate/YYYYMMDDHHMMSS_create_new_consensus_table.rb
class CreateNewConsensusTable < ActiveRecord::Migration[5.1]
  def change
    create_table :consensus do |t|
      t.string :name
      t.decimal :target, precision: 6, scale: 2
      t.decimal :max, precision: 6, scale: 2
      t.decimal :min, precision: 6, scale: 2
      t.integer :buy
      t.integer :hold
      t.integer :sell
      t.belongs_to :ticker, foreign_key: true
      t.timestamps
    end
    add_index :consensus, :name, unique: true
  end
end
