class ImportsController < ApplicationController

  def index
    @imports = Import.all
  end

  def show
    @import = Import.find params[:id]
  end

  def new
    @import = Import.new
  end

  def create
    @import = Import.new import_params
    if @import.save
      ImportDataProcessor.new(@import).call
      @import.reload
      redirect_to @import, notice: "Import was successfully created."
    else
      render action: 'new'
    end
  end

  private

  def import_params
    params.require(:import).permit(:data)
  end

end
