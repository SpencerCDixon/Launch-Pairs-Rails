class PairingsController < ApplicationController
  respond_to :js, :html

  def create
    @pairing = Pairing.new(user_id: current_user.id, pair_id: params[:pair_id])

    if @pairing.save
      respond_to do |format|
        format.html { redirect_to dashboard_path, info: "Pairing complete!" }
        format.js
      end
    else
      redirect_to root_path
    end
  end
end
