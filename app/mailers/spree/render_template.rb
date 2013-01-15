module Spree::RenderTemplate
  def render_email_template(template_params, format)
    email_template = Spree::StoreEmailTemplate.html(template_params)
    if email_template
      format.html do
        render :text => Mustache.render(email_template.template, mustache_params)
      end
    end

    format.text do
      email_template = Spree::StoreEmailTemplate.text(template_params)
      if email_template
        params = {:text => Mustache.render(email_template.template, mustache_params)}
      end
      render(params || {})
    end
  end
end
