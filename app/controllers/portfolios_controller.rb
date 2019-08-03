class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show,:edit,:update, :destroy]
  layout "portfolio"
  access all: [:show, :index, :react, :missing], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.all
  end

  def react 
    @react_portfolio_items = Portfolio.react
  end

  def show
    
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "New Portfolio Item is created"}
      else
        format.html { render :new}
      end
    end
  end

  def edit
    
  end

  def update
    
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "Portfolio Item is updated"}
      else
        format.html { render :edit}
      end
    end
  end

  def destroy
    
    @portfolio_item.destroy
    respond_to do |format|
      format.html {redirect_to portfolios_path, notice: "Portfolio item was removed"}
    end
  end

  def missing

  end

  private

    def set_portfolio
      @portfolio_item = Portfolio.find(params[:id])
    end

    def portfolio_params
      params.require(:portfolio).permit(:title, 
                                        :subtitle, 
                                        :body, 
                                        technologies_attributes: [:name]
                                       )
    end
end
