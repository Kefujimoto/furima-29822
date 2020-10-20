require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order = FactoryBot.build(:order_address)
  end

  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@order).to be_valid
  end

  it "tokenが空では登録できないこと" do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end

  it "area_idが1では登録できないこと" do
    @order.area_id = 1
    @order.valid?
    expect(@order.errors.full_messages).to include("Area must be other than 1")
  end

  it "post_numberが空では登録できないこと" do
    @order.post_number = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Post number can't be blank")
  end

  it "post_numberにハイフンがなければ登録できないこと" do
    @order.post_number = 1234567
    @order.valid?
    expect(@order.errors.full_messages).to include("Post number is invalid")
  end

  it "city_numberが空では登録できないこと" do
    @order.city_number = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("City number can't be blank")
  end

  it "house_numberが空では登録できないこと" do
    @order.house_number = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("House number can't be blank")
  end

  it "phone_numberが空では登録できないこと" do
    @order.phone_number = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number can't be blank")
  end

  it "phone_numberはハイフンが含まれると登録できないこと" do
    @order.phone_number = '090-1234-5678'
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number is not a number")
  end

  it "phone_numberが１１桁以内なら登録できること" do
    @order.phone_number = '09012345678'
    expect(@order).to be_valid
  end

end
