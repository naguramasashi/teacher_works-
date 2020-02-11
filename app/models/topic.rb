class Topic < ApplicationRecord
    validates :user_id, presence: true
    validates :grade, presence: true
    validates :unit, presence: true
    validates :lesson_img_or_lesson, presence: true
    private
    def lesson_img_or_lesson
      lesson_img.presence or lesson.presence
    end
    belongs_to :user
    mount_uploader :image, ImageUploader
end
