class AddActionAndTypeToSpreeStoreEmailTemplate < ActiveRecord::Migration
  def change
    add_column :spree_store_email_templates, :action, :string
    add_column :spree_store_email_templates, :format, :string
  end
end
