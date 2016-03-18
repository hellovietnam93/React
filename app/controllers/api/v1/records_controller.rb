class Api::V1::RecordsController < Api::BaseController

  def index
    respond_with Record.all
  end
end
