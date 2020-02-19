class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.integer :user_id
      #学年
      t.integer :grade
      #科目
      t.string :subject
      #単元
      t.string :unit
      #ねらい
      t.string :goal
      #概要
      t.string :summary
      #添付資料
      t.string :lesson
      #参考資料
      t.string :reference
      t.timestamps
    end
  end
end
