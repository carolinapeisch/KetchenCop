class Recall < ActiveRecord::Base
  belongs_to :product
  belongs_to :level
  belongs_to :region
  has_one :contact
  
  validates :product, presence: true
  validates :level, presence: true
  validates :region, presence: true
  validates :date, presence: true
  
  before_save :level_verify, :region_verify
  
  public
  
  def self.recalls_by_upc_code(upc_code)
    Recall.joins(:product).where("recalls.product_id = products.id and products.upc_code = ?", upc_code).order("recalls.date DESC").select('recalls.*')
  end
  
  def as_json(options={})
    super(:except => [:created_at, :updated_at],
          :include => {
            :product => { :except => [:created_at, :updated_at],
                          :methods => [:image] 
            }
          }
    )

  end

  private
  
  def level_verify
    if self.level_id.nil? || Level.find_by_id(level_id).nil?
      self.level_id = Level.get_default()
    end
  end
  
  def region_verify
    if self.region_id.nil? || Region.find_by_id(region_id).nil?
      self.region_id = Region.get_default()
    end
  end
  
end
