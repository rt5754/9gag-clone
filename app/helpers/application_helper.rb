module ApplicationHelper
  def get_current_page
    if current_page?(new_path)
      return new_path
    end
    if current_page?(hot_path)
      return hot_path
    end
    if current_page?(trending_path)
      return trending_path
    end
  end
end
