module StatusHelper
  def update_status(new_status)
    select new_status, from: "Description"
    click_on "Update status"
  end
end
