class LongUrlController < ApplicationController
  before_action :set_long_url, only: [:show, :edit, :update, :destroy]

  def index
    @long_url=LongUrl.all
  end

  def show
    redirect_to "#{@long_url.url}"
  end

  def new
    @long_url=LongUrl.new
  end

  def edit
  end

  def create
    @long_url=LongUrl.new(long_url_params)

    respond_to do |format|
      if @long_url.save
        format.html { redirect_to root_path, notice: 'Link has been added.' }
        format.json { render :show, status: :created, location: @long_url }
      else
        format.html { render :new }
        format.json { render json: @long_url.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @long_url.update(longlink_params)
        format.html { redirect_to @long_url, notice: 'Link has been added.' }
        format.json { render :show, status: :ok, location: @long_url }
      else
        format.html { render :edit }
        format.json { render json: @long_url.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @long_url.destroy
    respond_to do |format|
      format.html { redirect_to long_url_url, notice: 'Link deleted.' }
      format.json { head :no_content }
    end
  end

private

  def set_long_url
    @long_url = LongUrl.find(params[:id])
  end

  def long_url_params
    params.require(:long_url).permit(:url)
  end
end
