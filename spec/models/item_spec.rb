require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '商品新規登録がうまくいくとき' do
      it "nameとexplain、category_idとstaatus_id、chaarge_idとarea_id、days_idとpriceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "priceが半角数字であれば登録できる" do
        @item.price = "500"
        expect(@item).to be_valid
      end
    end

    context '商品新規登録がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("image can't be blank")
      end
      it "nameが空だと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      end
      it "explainが空では登録できない" do
        @item.explain = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it "category_idが空では登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category_id can't be blank")
      end
      it "status_idが空では登録できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status_id can't be blank")
      end
      it "charge_idが空では登録できない" do
        @item.charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge_id can't be blank")
      end
      it "area_idが空では登録できない" do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area_id can't be blank")
      end
      it "days_idが空では登録できない" do
        @item.days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days_id can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300以上でなければ登録できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is few(minimum is 300)")
      end
      it "priceが9999999以下でなければ登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is too many(maximum is 9999999)")
      end
      it "priceが半角数字以外の場合、登録ができない" do
        @item.price = "12ab"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Include only number")
    end
  end
end