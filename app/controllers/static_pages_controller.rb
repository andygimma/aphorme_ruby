#
# Developer : Andy Gimma (andy.n.gimma@gmail.com)
# Date : 08/14/13
# All code (c)2013 Andy Gimma all rights reserved
#

class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def guide
  end

  def signin
  end

  def signup
    @identity = env['omniauth.identity']
  end
end
