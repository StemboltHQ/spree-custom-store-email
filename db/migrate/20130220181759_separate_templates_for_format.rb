class SeparateTemplatesForFormat < ActiveRecord::Migration
  def up
    add_column :spree_store_email_templates, :text_template, :text
    add_column :spree_store_email_templates, :html_template, :text
    remove_column :spree_store_email_templates, :format
    remove_column :spree_store_email_templates, :template
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
