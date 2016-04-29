module ApplicationHelper

  def error_tag(model, field)
    if model.errors.has_key? field
      content_tag :div, "#{field.to_s.capitalize} #{model.errors[field].first}"
    end
  end

  def admins_only(&block)
    if !current_user.nil? && current_user.admin?
      block.call
    end
  end

end
