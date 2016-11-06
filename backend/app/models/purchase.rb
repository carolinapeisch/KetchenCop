class Purchase < ActiveRecord::Base
  belongs_to :region
  belongs_to :user
  has_and_belongs_to_many :product, join_table: "products_and_purchases" 
  
  validates :region, presence: true
  validates :user, presence: true
  validates :date, presence: true

end
