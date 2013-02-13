SpreeCustomStoreEmail
=====================

Allows you to customize the e-mail using Mustache templates.

Example
=======

A Spree::StoreEmailTemplate has the following attributes:

`store_id`: Spree::Store for this template
`mailer_class_name`: One of `Spree::OrderMailer` or `Spree::ShipmentMailer`
`template`: A full mustache template as a string as described below
`action`: The method called on the mailer, for example `confirm_email` or `cancel_email`
`format`: One of `text` or `html`

Here's a sample template for the order mailer:

```
{{#order.line_items}}
{{variant.product.name}} ({{quantity}}) = {{display_price}}
{{/order.line_items}}

Subtotal: {{order.display_item_total}}

{{#order.adjustments}}
Adjustment: {{label}} {{display_amount}}
{{/order.adjustments}}

Total: {{order.display_total}}
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec rspec spec

Copyright (c) 2013 FreeRunning Technologies, released under the New BSD License
