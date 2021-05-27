class User < ApplicationRecord
  has_many :tips
  has_many :comments
  has_and_belongs_to_many :favourites, class_name: Tip.name

  validates :email, presence: true,
                    uniqueness: true

  before_validation :downcase_email
  after_initialize :default_role!
  
#Add the has_secure_password in user class
    has_secure_password

    # Pagination
    paginates_per 6

    private

    def downcase_email
      self.email = email.downcase
    end

    def default_role!
      self.role ||= 'registered'
    end
end
