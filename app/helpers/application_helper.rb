module ApplicationHelper

  def timestamp_created(variable)
    created_day = variable.created_at.strftime('%Y/%m/%d')
    "作成日:#{created_day}"
  end

  def timestamp_updated(variable)
    updated_day = variable.updated_at.strftime('%Y/%m/%d')
    "更新日:#{updated_day}"
  end

end
