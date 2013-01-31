Spree::Order.class_eval do
  def to_hash
    ActiveRecord::Base.include_root_in_json = false
    hash = JSON.parse(
      self.to_json(
        :include => [
          :adjustments, {
            :line_items => {
              :include => {
                :variant => { :include => :product }
              }
            }
          }
        ]
      )
    )
    hash["display_total"] = display_total.to_s
    hash["display_outstanding_balance"] = display_outstanding_balance.to_s
    hash["display_item_total"] = display_item_total.to_s
    hash["display_adjustment_total"] = display_adjustment_total.to_s
    hash["line_items"].each_with_index do |value, key|
      hash["line_items"][key]["display_price"] = line_items[key].variant.display_price.to_s
    end
    hash["adjustments"].each_with_index do |value, key|
      hash["adjustments"][key]["display_amount"] = adjustments[key].display_amount.to_s
    end
    hash
  end

  def store_name
    store.nil? ? Spree::Config[:site_name] : store.name
  end
end
