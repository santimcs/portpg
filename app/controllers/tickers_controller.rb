class TickersController < ApplicationController
  before_action :set_ticker, only: [:show, :edit, :update, :destroy]

  # GET /tickers
  # GET /tickers.json
  def index
    if params[:keywords].present?
      @keywords = params[:keywords]
      ticker_search_term = TickerSearchTerm.new(@keywords)
      @tickers = Ticker.where(
        ticker_search_term.where_clause,
        ticker_search_term.where_args).
        order(ticker_search_term.order)
    else    
      @tickers = Ticker.all
    end
  end

  def list_tickers
    if params[:keywords].present?
      @keywords = params[:keywords]
      ticker_search_term = TickerSearchTerm.new(@keywords)
      @tickers = Ticker.where(
        ticker_search_term.where_clause,
        ticker_search_term.where_args).
        order(ticker_search_term.order)
    else    
      @tickers = Ticker.all
    end    
  end

  # GET /tickers/1
  # GET /tickers/1.json
  def show
    @epss = @ticker.epss.order('year desc, quarter desc')
    @stock = @ticker.stock
    @consensu = @ticker.consensu   
    @portfolio = @ticker.portfolio            
    @yr_profits = @ticker.yr_profits.order('year desc, quarter desc')
    @charts = @ticker.charts.order('year desc, quarter desc')  
  end

  # GET /tickers/new
  def new
    @ticker = Ticker.new
  end

  # GET /tickers/1/edit
  def edit
  end

  # POST /tickers
  # POST /tickers.json
  def create
    @ticker = Ticker.new(ticker_params)

    respond_to do |format|
      if @ticker.save
        format.html { redirect_to @ticker, notice: 'Ticker was successfully created.' }
        format.json { render :show, status: :created, location: @ticker }
      else
        format.html { render :new }
        format.json { render json: @ticker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickers/1
  # PATCH/PUT /tickers/1.json
  def update
    respond_to do |format|
      if @ticker.update(ticker_params)
        format.html { redirect_to @ticker, notice: 'Ticker was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticker }
      else
        format.html { render :edit }
        format.json { render json: @ticker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickers/1
  # DELETE /tickers/1.json
  def destroy
    @ticker.destroy
    respond_to do |format|
      format.html { redirect_to tickers_url, notice: 'Ticker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticker
      @ticker = Ticker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticker_params
      params.require(:ticker).permit(:name, :full_name, :sector, :subsector, :market, :website)
    end
end
