SpreeCustomStoreEmail
=====================

Allows you to customize the e-mail using Mustache templates.

Example
=======

Here's a sample template:

```
{{#order.line_items}}
{{variant.product.name}} ({{quantity}}) = {{display_price}}
{{/order.line_items}}

Subtotal: {{order.display_item_total}}

{{#order.adjustments}}
Adjustment: {{label}} {{display_amount}}
{{/order.adjustments}}
```

Total: {{order.display_total}}

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec rspec spec

Copyright (c) 2013 [name of extension creator], released under the New BSD License
