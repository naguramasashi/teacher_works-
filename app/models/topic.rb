class Topic < ApplicationRecord
    validates :user_id, presence: true
    validates :grade, presence: true
    validates :unit, presence: true
    validates :lesson, presence: true
    belongs_to :user
    has_many :coments
    has_one_attached :lesson
    
end
