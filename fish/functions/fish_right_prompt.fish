function fish_right_prompt
  set -l status_copy $status

  if test "$status_copy" -ne 0
    set_color "$fish_color_error"
    echo -sn "($status_copy)"
  end

  set_color normal

  if set -l job_id (last_job_id)
    for job in $job_id
      echo -sn " %$job"
    end
  end

  set_color normal
end
