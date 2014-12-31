class PairingsController < ApplicationController
  def create
    @pairing = Pairing.new(user_id: current_user.id, pair_id: params[:pair_id])

    if @pairing.save
      redirect_to dashboard_path, notice: "Pairing complete!"
    else
      redirect_to dashboard_path, alert: "Already paired with that person!"
    end
  end
end
