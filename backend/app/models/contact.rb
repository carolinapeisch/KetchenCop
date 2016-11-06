class Contact < ActiveRecord::Base
  before_save { self.email = email.downcase }  
  validate :phone_or_email
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :phone, uniqueness: true
  validates :email, length: { minimum: 3, maximum: 40 },
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  private

    def phone_or_email
      unless !(phone.blank? && email.blank?)
        errors.add(:base, "should at least provide a phone or email.")
      end
    end
    
    
end
