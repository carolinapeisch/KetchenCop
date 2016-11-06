class Region < ActiveRecord::Base
  has_one :image
  has_many :purchases
  has_many :recalls
  
  validates :display_name, presence: true, uniqueness: { case_sensitive: false }
  
  public
  def self.get_default()
      return 1
  end
  
end
