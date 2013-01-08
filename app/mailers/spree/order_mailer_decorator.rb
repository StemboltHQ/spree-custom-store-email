Spree::OrderMailer.class_eval do
  def confirm_email(order, resend = false)
    @order = order
    subject = (resend ? "[#{t(:resend).upcase}] " : '')
    subject += "#{Spree::Config[:site_name]} #{t('order_mailer.confirm_email.subject')} ##{order.number}"

    mail(:to => order.email, :subject => subject) do |format|
      render_email_template(__method__, format)
    end
  end

  def cancel_email(order, resend = false)
    @order = order
    subject = (resend ? "[#{t(:resend).upcase}] " : '')
    subject += "#{Spree::Config[:site_name]} #{t('order_mailer.cancel_email.subject')} ##{order.number}"

    mail(:to => order.email, :subject => subject) do |format|
      render_email_template(__method__, format)
    end
  end

  private
  def render_email_template(action, format)
    params = {
      :mailer_class_name => self.class.to_s,
      :store_id => @order.store.id,
      :action => action
    }

    email_template = Spree::StoreEmailTemplate.html(params)
    if email_template
      format.html do
        render :text => Mustache.render(email_template.template, :order => @order.to_hash)
      end
    end

    format.text do
      email_template = Spree::StoreEmailTemplate.text(params)
      if email_template
        params = {:text => Mustache.render(email_template.template, :order => @order.to_hash)}
      end
      render(params || {})
    end
  end
end
