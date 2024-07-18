class Tag < ApplicationRecord
    validates :name, presence: true
    
    has_many :company_tags, dependent: :destroy
    has_many :companies, through: :company_tags
end
