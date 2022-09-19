module AdminHelper
  def home_nav_classes
    return "bg-blue-800 text-white" if request.path.ends_with?("/admin")

    "text-blue-100 hover:bg-blue-600"
  end

  def primary_nav_classes(resource)
    return "bg-blue-800 text-white" if request.path.include?(resource)

    "text-blue-100 hover:bg-blue-600"
  end
end
