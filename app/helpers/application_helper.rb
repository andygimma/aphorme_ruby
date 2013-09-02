module ApplicationHelper
  def user_nav
    nav = '	 <li>
										<a href="" class="icon icon-bar-chart"><span>User</span></a>
										<ul>
											<li><a href="/terms/new">Add Term</a></li>
											<li><a href="/logout">Logout</a></li>
											
										</ul>
									</li>'
    if session[:user_email].nil?
      nav = '<li><a class="icon icon-retweet" href="/signin"><span>Sign in</span></a></li>'
    end
    nav
  end
end
