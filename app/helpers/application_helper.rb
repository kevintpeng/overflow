module ApplicationHelper
  # conversion of flash values to html class
  def flash_class(level)1
    level = level.to_sym
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-danger"
    when :alert then "alert alert-danger"
    end
  end
  def find_commentable   # gets the type of comment to create
    params.each do |name, value|
      # matches the type of id using regex
      if name =~ /(.+)_id$/
        # returns the active record being referenced
        # using constantize converts the string to any defined constant
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
