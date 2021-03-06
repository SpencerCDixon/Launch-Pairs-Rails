class PairingsController < ApplicationController
  respond_to :html, :json

  def create
    @pairing = Pairing.new(user_id: current_user.id, pair_id: params[:pair_id])

    if @pairing.save
      respond_to do |format|
        format.html { redirect_to dashboard_path, info: "Pairing complete!" }
        format.json { render json: @pairing }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: @pairing.errors, status: 422 }
      end
    end
  end
end
