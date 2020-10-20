class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_number,    default: "",  null: false
      t.integer :area_id,                     null: false
      t.string :city_number,    default: "",  null: false
      t.string :house_number,   default: "",  null: false
      t.string :building_name,  default: ""
      t.string :phone_number,   default: "",  null: false
      
      t.references :order,                    null: false,  foreign_key: true
      t.timestamps
    end
  end
end
