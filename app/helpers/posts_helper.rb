module PostsHelper
  def upvote_link(user, post)
    if logged_in? && user.voted_up_on?(post)
      btn_class = "btn btn-md btn-success btn-vote disabled"
    else
      btn_class = "btn btn-md btn-vote"
    end

    link_to upvote_path(:post_id => post.id, :page => get_current_page, :pagination_page => params[:page]), class: btn_class, :method => :post do
      concat content_tag(:span, "", class: "glyphicon glyphicon-arrow-up")
    end
  end
  
  def downvote_link(user, post)
    if logged_in? && user.voted_down_on?(post)
      btn_class = "btn btn-md btn-danger btn-vote disabled"
    else
      btn_class = "btn btn-md btn-vote"
    end

    link_to downvote_path(:post_id => post.id, :page => get_current_page), class: btn_class, :method => :post do
      concat content_tag(:span, "", class: "glyphicon glyphicon-arrow-down")
    end
  end
  
end
