module StatusHelper
  def update_status(new_status)
    find("#status_description").find(:option, new_status).select_option
    click_on "Update status"
  end
end
