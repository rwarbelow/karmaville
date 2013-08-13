class UsersController < ApplicationController
  def index
    @page_num = params["page"].to_i
    @page_num = 1 if @page_num == 0
    @users = User.by_karma.page(@page_num)
  end
end
