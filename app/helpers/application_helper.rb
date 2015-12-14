module ApplicationHelper

  def sortable(column, title = nil, author_id = nil, text = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "pretty current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction, :search => {author_id: author_id, text: text }}, {:class => css_class}
  end
end
