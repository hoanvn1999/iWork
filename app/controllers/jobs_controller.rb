class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    job = current_user.build(job_params)
    if job.save
      flash[:success] = "Tạo công việc thành công"
      redirect_to jobs_path
    else
      flash.now[:warning] = "Tạo công việc thất bại, vui lòng kiểm tra lại thông tin"
      render :new
    end
  end

  def edit
    @job = Job.find_by id: params[:id]
  end

  def update
    @job = Job.find_by id: params[:id]
    if job.update job_params
      flash[:success] = "Chỉnh sửa thông tin thành công"
      redirect_to jobs_path
    else
      flash.now[:warning] = "Chỉnh sửa thông tin thất bại, vui lòng kiểm tra lại thông tin"
      render :edit
    end
  end

  private

  def job_params
    params.require(:job).permit :title, :salary,
                                    :time, :number_of_staffs
  end
end
