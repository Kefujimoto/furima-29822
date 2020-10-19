class OrderAddress

   include ActiveModel::Model
   attr_accessor :token, :area_id, :post_number, :city_number, :house_number, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :area_id, numericality: { other_than: 1 }
    validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city_number
    validates :house_number
    validates :building_name
    validates :phone_number, numericality: true, length: { maximum: 11 }
    
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(area_id: area_id, post_number: post_number, city_number: city_number, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id )
  end

end