module PagesHelper
  
  def getNewLinkClasses
    if get_current_page == new_path
      return 'active'
    else 
      return ''
    end
  end
  
  def getTrendingLinkClasses
    if get_current_page == trending_path
      return 'active'
    else 
      return ''
    end
  end
  
  def getHotLinkClasses
    if get_current_page == hot_path
      return 'active'
    else 
      return ''
    end
  end
  
  
end