class ResumesController < ApplicationController

  def index
    @job = Job.all
  end

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.job = @job
    @resume.user = current_user

    if @resume.save
      redirect_to job_path(@job), notice: "上传成功"
    else
      render :new
    end
  end

  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end
end
