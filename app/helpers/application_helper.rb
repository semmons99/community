module ApplicationHelper

  def error_messages_for(object)
    if object.errors.any?
      content_tag(:div, :id => "errorExplanation") do
        content_tag(:h2) { "Whoops, looks like something went wrong." } +
        content_tag(:p) { "Please review the form below and make the appropriate changes." } +
        content_tag(:ul) do
          object.errors.full_messages.map do |msg|
            content_tag(:li) { msg }
          end.join("\n").html_safe
        end
      end
    end
  end

  def md(content)
    return if content.blank?

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      :autolink            => true,
      :space_after_headers => true,
      :no_intra_emphasis   => true,
      :fenced_code_blocks  => true)

    markdown.render(content).html_safe
  end

end