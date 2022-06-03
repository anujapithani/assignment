class CreateFeedbackforms < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbackforms do |t|
      t.string :name
      t.integer :rating
      t.string :comments

      t.timestamps
    end
  end
end
