class Level < ActiveRecord::Base
    has_many :recalls
    validates :display_name, presence: true, uniqueness: { case_sensitive: false }
    
    public
    def self.get_default()
        return 1
    end
end
