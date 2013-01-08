class Spree::StoreEmailTemplate < ActiveRecord::Base
  belongs_to :store, class_name: 'Spree::Store'

  validates :format, :inclusion => { :in => %w(text html) }

  attr_accessible :store_id, :mailer_class_name, :template, :action, :format

  def self.html(params)
    self.where(:format => "html").where(params).first
  end

  def self.text(params)
    self.where(:format => "text").where(params).first
  end
end
