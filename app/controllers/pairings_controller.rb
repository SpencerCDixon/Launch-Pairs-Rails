class PairingsController < ApplicationController
  def create
    @pairing = Pairing.new(user_id: current_user.id, pair_id: params[:pair_id])

    if @pairing.save
      redirect_to dashboard_path, notice: "Pairing complete!"
    else
      flash.now.alert 'nope'
      render 'dashboard#show'
    end
  end
end
