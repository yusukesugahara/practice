module SquaresHelper

  def timestamp_create_update(variable)
    created_day = variable.created_at.strftime('%Y/%m/%d')
    updated_day = variable.updated_at.strftime('%Y/%m/%d')
    "作成日:#{created_day}  更新日:#{updated_day}"
  end

end
