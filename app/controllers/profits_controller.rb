class ProfitsController < ApplicationController
  before_action :set_profit, only: [:show, :edit, :update, :destroy]

  # GET /profits
  # GET /profits.json
  def index
    @profits = Profit.all
  end

  def list_profits_q1
      @profits = Profit.order(name: :asc)
  end

  def list_profits_q2
      @profits = Profit.where("publish_date >= '2018-07-01'").order(name: :asc, quarter: :desc)
  end

  def list_profits_q3
      @profits = Profit.where("publish_date >= '2022-10-01'").order(name: :asc, quarter: :desc)
  end
  def list_profits_q4
      @profits = Profit.where("publish_date >= '2023-01-01'").order(name: :asc, quarter: :desc)
  end

  # GET /profits/1
  # GET /profits/1.json
  def show
  end

  # GET /profits/new
  def new
    @profit = Profit.new
  end

  # GET /profits/1/edit
  def edit
  end

  # POST /profits
  # POST /profits.json
  def create
    @profit = Profit.new(profit_params)

    respond_to do |format|
      if @profit.save
        format.html { redirect_to @profit, notice: 'Profit was successfully created.' }
        format.json { render :show, status: :created, location: @profit }
      else
        format.html { render :new }
        format.json { render json: @profit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profits/1
  # PATCH/PUT /profits/1.json
  def update
    respond_to do |format|
      if @profit.update(profit_params)
        format.html { redirect_to @profit, notice: 'Profit was successfully updated.' }
        format.json { render :show, status: :ok, location: @profit }
      else
        format.html { render :edit }
        format.json { render json: @profit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profits/1
  # DELETE /profits/1.json
  def destroy
    @profit.destroy
    respond_to do |format|
      format.html { redirect_to profits_url, notice: 'Profit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profit
      @profit = Profit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profit_params
      params.require(:profit).permit(:name, :year, :quarter, :kind, :latest_amt_y, :previous_amt_y, :inc_amt_y, :inc_pct_y, :latest_amt_q, :previous_amt_q, :inc_amt_q, :inc_pct_q, :q_amt_c, :y_amt, :inc_amt_py, :inc_pct_py, :q_amt_p, :inc_amt_pq, :inc_pct_pq, :mean_pct, :std_pct, :publish_date, :ticker_id)
    end
end
