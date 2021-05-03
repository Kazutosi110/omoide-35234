class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string     :store_name,                      null: false                   
      t.string     :store_type,                      null: false                   
      t.text       :information,                     null: false                   
      t.integer    :place_area_id,                   null: false                    
      t.string     :phone,                           null: false                   
      t.references :user,                            foreign_key: true
      t.timestamps
    end
  end
end
