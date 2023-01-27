module ApplicationHelper
  def active_link(path)
    if current_page?(path)
      'bg-blue-700 text-white'
    else
      'bg-blue-600 text-gray-100'
    end
  end
end
