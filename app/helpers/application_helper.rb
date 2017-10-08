module ApplicationHelper
  def get_current_page
    if current_page?(new_path)
      return new_path
    end
    if current_page?(post_path)
      return post_path
    end
    if current_page?(hot_path)
      return hot_path
    end
    if current_page?(user_path)
      return user_path
    end
  end
end
