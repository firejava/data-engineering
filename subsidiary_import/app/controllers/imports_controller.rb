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
      # Process the data (extract line items, calculate gross revenue, etc.)
      @import = ImportDataProcessor.new(@import).call

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
