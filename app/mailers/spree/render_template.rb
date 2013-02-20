module Spree::RenderTemplate
  def render_email_template(format, mailer_class_name, store, action)
    email_template = Spree::StoreEmailTemplate.search(mailer_class_name, store, action)
    if email_template.try(:html_template)
      format.html do
        render :text => Mustache.render(email_template.html_template, mustache_params)
      end
    end

    format.text do
      if email_template
        params = {:text => Mustache.render(email_template.text_template, mustache_params)}
      end
      render(params || {})
    end
  end
end
