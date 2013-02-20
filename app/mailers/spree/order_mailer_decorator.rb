Spree::OrderMailer.class_eval do
  include Spree::RenderTemplate

  # This modified the subject to be the store name, and use the custom e-mail template
  # rendering.
  def confirm_email(order, resend = false)
    @order = order
    subject = (resend ? "[#{t(:resend).upcase}] " : '')
    subject += "#{order.store_name} #{t('order_mailer.confirm_email.subject')} ##{order.number}"

    mail(:to => order.email, :subject => subject) do |format|
      render_email_template(format, self.class.to_s, @order.store, __method__)
    end
  end

  # This modified the subject to be the store name, and use the custom e-mail template
  # rendering.
  def cancel_email(order, resend = false)
    @order = order
    subject = (resend ? "[#{t(:resend).upcase}] " : '')
    subject += "#{order.store_name} #{t('order_mailer.cancel_email.subject')} ##{order.number}"

    mail(:to => order.email, :subject => subject) do |format|
      render_email_template(format, self.class.to_s, @order.store, __method__)
    end
  end

  private
  def mustache_params
    { :order => @order.to_hash }
  end
end
