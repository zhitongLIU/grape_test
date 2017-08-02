#
class StocksController < ApplicationController
  def index
    @model = Stock::Index.present(params).model
  end

  def show
  end

  # rubocop: disable Metrcis/AbcSize
  def create
    params[:name] = params['stock'][:name]
    params[:quantity] = params['stock'][:quantity]
    op = Stock::Create.call(params)
    respond_to do |format|
      if op.errors.any?
        format.html { redirect_to stocks_url, notice: 'Task was successfully created' }
      else
        format.html { redirect_to stocks_url, notice: 'Fail to create new one' }
      end
    end
  end
  # rubocop: enable Metrcis/AbcSize

  def new
  end

  def edit
    @stock = Stock::Show.present(params).model
  end

  # rubocop: disable Metrcis/AbcSize
  def update
    params[:name] = params['stock'][:name]
    params[:quantity] = params['stock'][:quantity]
    op = Stock::Update.call(params)
    respond_to do |format|
      if op.errors.any?
        format.html { redirect_to stocks_url, notice: 'Task was successfully updated.' }
      else
        format.html { redirect_to stocks_url, notice: 'Fail to updated record' }
      end
    end
  end
  # rubocop: enable Metrcis/AbcSize

  def destroy
    op = Stock::Destroy.call(params)
    respond_to do |format|
      if op.errors.any?
        format.html { redirect_to stocks_url, notice: 'Task was successfully destroyed.' }
      else
        format.html { redirect_to stocks_url, notice: 'Fail to destroy record' }
      end
    end
  end

  def history
    @id = params['id']
    @history = Stock::HistoryIndex.call(params).model
    pp @history
  end
end
