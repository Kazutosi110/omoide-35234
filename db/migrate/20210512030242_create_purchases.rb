class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer     :people_id,             null: false
      t.datetime    :starting_time,         null: false
      t.datetime    :ending_time,           null: false
      t.text        :hate_list
      t.references  :record,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
