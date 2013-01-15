Spree::Shipment.class_eval do
  def to_hash
    ActiveRecord::Base.include_root_in_json = false
    hash = attributes

    hash["manifest"] = manifest.map do |manifest_item|
      {
        "variant" => manifest_item.variant.attributes.merge({ "product" => manifest_item.variant.product.attributes }),
        "quantity" => manifest_item.quantity
      }
    end
    hash
  end
end
