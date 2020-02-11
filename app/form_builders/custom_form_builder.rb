class CustomFormBuilder < ActionView::Helpers::FormBuilder

  def pick_errors(attribute)
    return nil if @object.nil? || (messages = @object.errors.messages[attribute]).nil?
    lis = messages.collect do |message|
      %{<li>#{@object.errors.full_message(attribute, message)}</li>}
    end.join

    %{<ul class="errors">#{lis}</ul>}.html_safe
  end

  def text_field(attribute, options={})
    return super if options[:no_errors]

    super + pick_errors(attribute)
  end
  def password_field(attribute, options={})
    return super if options[:no_errors]

    super + pick_errors(attribute)
  end
  def full_message(attribute, message)
  return message if attribute == :base
  attr_name = attribute.to_s.tr('.', '_').humanize
  attr_name = @base.class.human_attribute_name(attribute, default: attr_name)
  I18n.t(:"errors.format", {
    default:  "%{attribute} %{message}",
    attribute: attr_name,
    message:   message
  })
  end
end