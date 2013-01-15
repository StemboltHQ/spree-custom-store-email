Spree::OrderMailer.class_eval do
  include Spree::RenderTemplate

  def confirm_email(order, resend = false)
    @order = order
    subject = (resend ? "[#{t(:resend).upcase}] " : '')
    subject += "#{Spree::Config[:site_name]} #{t('order_mailer.confirm_email.subject')} ##{order.number}"

    mail(:to => order.email, :subject => subject) do |format|
      render_email_template(template_params(__method__), format)
    end
  end

  def cancel_email(order, resend = false)
    @order = order
    subject = (resend ? "[#{t(:resend).upcase}] " : '')
    subject += "#{Spree::Config[:site_name]} #{t('order_mailer.cancel_email.subject')} ##{order.number}"

    mail(:to => order.email, :subject => subject) do |format|
      render_email_template(template_params(__method__), format)
    end
  end

  private
  def template_params(action)
    {
      :mailer_class_name => self.class.to_s,
      :store_id => @order.store.id,
      :action => action
    }
  end

  def mustache_params
    { :order => @order.to_hash }
  end
end
