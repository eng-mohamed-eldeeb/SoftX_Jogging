class CreateJoggingTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :jogging_times do |t|
      t.date :date
      t.string :distance
      t.datetime :time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
