module ApplicationHelper

  def error_tag(model, field)
    if model.errors.has_key? field
      content_tag :div, "#{field.to_s.capitalize} #{model.errors[field].first}"
    end
  end

end
