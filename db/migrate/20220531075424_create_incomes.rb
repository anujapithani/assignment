class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.integer :avg
      t.integer :totalincome
      t.integer :percentage

      t.timestamps
    end
  end
end
