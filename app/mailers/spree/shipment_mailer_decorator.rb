Spree::ShipmentMailer.class_eval do
  include Spree::RenderTemplate

  # This modified the subject to be the store name, and use the custom e-mail template
  # rendering.
  def shipped_email(shipment, resend = false)
    @shipment = shipment
    subject = (resend ? "[#{t(:resend).upcase}] " : '')
    subject += "#{shipment.order.store_name} #{t('shipment_mailer.shipped_email.subject')} ##{shipment.order.number}"
    mail(:to => shipment.order.email,
         :subject => subject) do |format|
      render_email_template(template_params(__method__), format)
    end
  end

  private
  def template_params(action)
    {
      :mailer_class_name => self.class.to_s,
      :store_id => @shipment.order.store.id,
      :action => action
    }
  end

  def mustache_params
    { :shipment => @shipment.to_hash }
  end
end
