module ApplicationHelper
  # conversion of flash values to html class
  def flash_class(level)
    level = level.to_sym
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-danger"
    when :alert then "alert alert-danger"
    end
  end
end
