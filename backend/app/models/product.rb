class Product < ActiveRecord::Base
  has_one :image
  has_many :recalls, dependent: :destroy
  has_and_belongs_to_many :purchase, join_table: "products_and_purchases"
  
  validates :name, presence: true
  before_save :image_verify
  
  public
  
  def image
    if !self.image_id.nil? && !Image.find_by_id(self.image_id).nil?
      Image.find_by_id(self.image_id)
    end
  end

  private
  
  def image_verify
    if self.image_id.nil? || Image.find_by_id(image_id).nil?
      self.image_id = Image.get_default()
    end
  end
end
