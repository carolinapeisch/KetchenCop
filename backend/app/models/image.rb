class Image < ActiveRecord::Base
    validates :filename, presence: true
    validates :category, presence: true, numericality: { only_integer: true }
    
    public
    def self.get_default()
        return 1
    end
    
    def as_json(options={})
        super(:except => [:created_at, :updated_at])

  end
end
