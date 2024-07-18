class Company < ApplicationRecord
    belongs_to :user
    
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :company_tags, dependent: :destroy
    has_many :tags, through: :company_tags
    
    validates :name, presence: true
    validates :industry, presence: true
    validates :status, presence: true
    validates :url, presence: true, format: URI::regexp(%w[http https])
    validates :id_copy, presence: true
    validates :password, presence: true
    validates :schedule, presence: true
end