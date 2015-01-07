module StatusHelper
  def update_status(new_status)
    find("#status_description").find(:option, new_status).select_option
    click_on "Update status"
  end

  def create_pair(user1, user2)
    user1.pairings.create(user_id: user1.id, pair_id: user2.id)
  end
end
