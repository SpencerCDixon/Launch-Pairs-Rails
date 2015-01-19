class DashboardsController < ApplicationController
  before_action :authenticate
  respond_to :html, :json, only: :show

  def show
    if params[:query] == "pair"
      @users = User.ready_to_pair
    elsif params[:query] == "help"
      @users = User.open_to_help
    elsif params[:query] == "lucky"
      @users = User.feeling_lucky(current_user)
    else
      @users = User.all.limit(20)
    end
    @users_json = ActiveModel::ArraySerializer.new(@users, root: :users, scope: current_user).to_json

    @feed = Dashboard.display_feed

    respond_to do |format|
      format.html
      format.json { render json: @users_json }
    end
  end

  # Don't know how to properly test this feature, ask for dans help, should also be refactored into it's own rest model
  def send_flow
    flow = Flowdock::Flow.new(api_token: ENV['LP_FLOW'],
        source: "LaunchPairs", from:  { name: current_user.first_name, address: current_user.email })

    flow.push_to_chat(:content => params[:flow][:question], :external_user_name => current_user.first_name)

    flash[:success] = "Your question was sent! Check the flow for any answers"
    redirect_to dashboard_path
  end
end
