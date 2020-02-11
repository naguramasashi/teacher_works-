class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.integer :user_id
      #学年
      t.string :grade
      #単元
      t.string :unit
      #ねらい
      t.string :goal
      #概要
      t.string :summary
      #授業のファイル
      t.string :lesson
      #授業の流れを書いたノートなどの写真
      t.string :lesson_img
      #使用する教材
      t.string :teaching_material
      #参考資料
      t.string :reference
      t.timestamps
    end
  end
end
