class CreateStoreEmailTemplates < ActiveRecord::Migration
  def change
    create_table :spree_store_email_templates do |t|
      t.integer :store_id
      t.string :mailer_class_name
      t.text :template

      t.timestamps
    end
  end
end
