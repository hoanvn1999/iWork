class HomepagesController < ApplicationController
  def index
    @jobs = Job.all.limit 12
  end

  def show
    @job = Job.find_by id: params[:id]
  end
end
