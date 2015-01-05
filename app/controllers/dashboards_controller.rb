class DashboardsController < ApplicationController
  before_action :authenticate

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

    @feed = Dashboard.display_feed
  end

  # Don't know how to properly test this feature, ask for dans help
  def send_flow
    flow = Flowdock::Flow.new(:api_token => ENV['LP_FLOW'],
        :source => "LaunchPairs", :from => {:name => current_user.first_name, :address => current_user.email})

    flow.push_to_chat(:content => params[:flow][:question], :external_user_name => current_user.first_name.gsub!(/\s/, ""))
    flash[:success] = "Your question was sent! Check the flow for any answers"
    redirect_to dashboard_path
  end
end
