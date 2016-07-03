module HomeHelper
  def todo_status(to_do)
    to_do.completed.present? ? "Done" : "New"
  end
end
