If navbar does not drop down when minimize,
check the following points:
	1) There must be gem 'jquery-rails' in Gemfile. 
	2) In application.js, content must be like this:
		//= require jquery
		//= require_tree .

Portfolios table
----------------
rails g model portfolio name date:date buy_qty:integer sell_qty:integer comp_qty:integer att_qty:integer buy_unit_cost:decimal{6,2} comp_unit_cost:decimal{6,2} att_unit_cost:decimal{6,2} buy_cost_amt:decimal comp_cost_amt:decimal att_cost_amt:decimal last_sell_price:decimal{6,2} target_sell_price:decimal{6,2}
buy_method:integer sell_method:integer ticker:belongs_to 

Profits table
-------------
rails g model profit name year:integer quarter:integer kind:integer latest_amt_y:integer previous_amt_y:integer inc_amt_y:integer inc_pct_y:decimal latest_amt_q:integer previous_amt_q:integer inc_amt_q:integer inc_pct_q:decimal q_amt_c:integer y_amt:integer inc_amt_py:integer inc_pct_py:decimal q_amt_p:integer inc_amt_pq:integer inc_pct_pq:decimal mean_pct:decimal std_pct:decimal publish_date:date ticker:belongs_to

rails g scaffold profit name year:integer quarter:integer kind:integer latest_amt_y:integer previous_amt_y:integer inc_amt_y:integer inc_pct_y:decimal latest_amt_q:integer previous_amt_q:integer inc_amt_q:integer inc_pct_q:decimal q_amt_c:integer y_amt:integer inc_amt_py:integer inc_pct_py:decimal q_amt_p:integer inc_amt_pq:integer inc_pct_pq:decimal mean_pct:decimal std_pct:decimal publish_date:date ticker:belongs_to --skip-migration