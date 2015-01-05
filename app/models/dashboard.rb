class Dashboard 

  def self.display_feed
    projects = Project.all
    statuses = Status.all
    (projects + statuses).sort_by(&:created_at).reverse.take(5)
  end
end
