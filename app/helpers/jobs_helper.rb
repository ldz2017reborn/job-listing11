module JobsHelper
  def render_job_status(job)
    if job.is_hidden
      "(Public)"
    else
      "(Hidden)"
    end
  end
end
